//
//  ImageGridViewController.swift
//  FictiveKin
//
//  Created by niv ben-porath on 02/07/2020.
//  Copyright © 2020 nbpApps. All rights reserved.
//

import UIKit

class ImageGridViewController: UIViewController {
    
    private lazy var collectionView = makeCollectionView()
    private lazy var dataSource = makeDataSource()
    
    let imageListViewModel : ImageListViewModel
    
    //MARK: - life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
//        layoutCollectionView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        layoutCollectionView()

    }
    
    //MARK: - init
    init(imageListViewModel : ImageListViewModel) {
        self.imageListViewModel = imageListViewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    private func layoutCollectionView() {
        view.addSubview(collectionView)
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            collectionView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
    
    //MARK: - factory
    private func makeCollectionView() -> UICollectionView {
        let collectionView =  UICollectionView(frame: view.bounds, collectionViewLayout:UIConfig.createCompositionalLayout2())
        collectionView.backgroundColor = .clear
        collectionView.register(ImageCell.self, forCellWithReuseIdentifier: ImageCell.reuseId)
        collectionView.delegate = self
        collectionView.dataSource = dataSource
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        return collectionView
    }
    
    private func makeDataSource() -> ImagesCollectionViewDataSource {
        return ImagesCollectionViewDataSource(imageListViewModel: imageListViewModel)
    }
    
    func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {
        if scrollView.didReachEndOfList() {
            imageListViewModel.showNextPage { [weak self](error) in
                guard let self = self else {return}
                DispatchQueue.main.async {
                    self.collectionView.reloadData()
                }
            }
        }
    }
    
}

extension ImageGridViewController : UICollectionViewDelegate {
     func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let imageInfo = imageListViewModel.image(at: indexPath.row)
        if let fullImageUrl = URL(string:imageInfo.largeImageURL) {
            let fullImageViewController = FullImageViewController(fullImageUrl: fullImageUrl)
            navigationController?.present(fullImageViewController, animated: true, completion: nil)
        }
    }
}

