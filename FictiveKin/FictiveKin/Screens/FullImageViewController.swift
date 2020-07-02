//
//  FullImageViewController.swift
//  FictiveKin
//
//  Created by niv ben-porath on 02/07/2020.
//  Copyright © 2020 nbpApps. All rights reserved.
//

import UIKit
import Kingfisher

class FullImageViewController: UIViewController {
    
    private lazy var fullImageView = makeFullImageView()
    private lazy var shareButton = makeShareButton()
    private lazy var closeButton = makeCloseButton()
    
    let fullImageUrl : URL
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureView()
        layoutView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        configureImageView()
    }
    
    //MARK: - init
    init(fullImageUrl : URL) {
        self.fullImageUrl = fullImageUrl
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - configure
    private func configureView() {
        view.backgroundColor = UIColor(white: 0.2, alpha:0.95)
    }
    
    private func configureImageView() {
        fullImageView.kf.indicatorType = .activity
        fullImageView.kf.setImage(with: fullImageUrl)
    }
    
    
    //MARK: - layout
    private func layoutView() {
        view.addSubview(fullImageView)
        view.addSubview(shareButton)
        view.addSubview(closeButton)
        
        NSLayoutConstraint.activate([
            fullImageView.topAnchor.constraint(equalTo: view.layoutMarginsGuide.topAnchor),
            fullImageView.leadingAnchor.constraint(equalTo: view.layoutMarginsGuide.leadingAnchor),
            fullImageView.trailingAnchor.constraint(equalTo: view.layoutMarginsGuide.trailingAnchor),
            fullImageView.bottomAnchor.constraint(equalTo: view.layoutMarginsGuide.bottomAnchor),
            
            closeButton.topAnchor.constraint(equalTo: view.layoutMarginsGuide.topAnchor, constant: Constraints.buttonPadding),
            closeButton.trailingAnchor.constraint(equalTo: view.layoutMarginsGuide.trailingAnchor, constant: -Constraints.buttonPadding),
            closeButton.heightAnchor.constraint(equalToConstant: Constraints.iconButtonSize),
            closeButton.widthAnchor.constraint(equalToConstant: Constraints.iconButtonSize),
            
            shareButton.topAnchor.constraint(equalTo: view.layoutMarginsGuide.topAnchor, constant: Constraints.buttonPadding),
            shareButton.leadingAnchor.constraint(equalTo: view.layoutMarginsGuide.leadingAnchor, constant: Constraints.buttonPadding),
            shareButton.heightAnchor.constraint(equalToConstant: Constraints.iconButtonSize),
            shareButton.widthAnchor.constraint(equalToConstant: Constraints.iconButtonSize)
        ])
    }
    
    //MARK: - actions
    @objc private func shareButtonTapped() {
        showShareSheet()
    }
    
    private func showShareSheet() {
        guard let image = fullImageView.image else {return}
        let activityViewController = UIActivityViewController(activityItems: [image], applicationActivities: nil)
        present(activityViewController, animated: true, completion: nil)
    }
    
    @objc private func closeButtonTapped() {
        dismissView()
    }
    
    private func dismissView() {
        self.dismiss(animated: true, completion: nil)
    }
    
    
    //MARK: - factory
    private func makeFullImageView() -> NBPImageView{
        let imageView = NBPImageView(cornerRadius: 15)
        imageView.contentMode = .scaleAspectFit
        return imageView
    }
    
    private func makeShareButton() -> NBPButton {
        let shareButton = NBPButton(image: .share)
        shareButton.addTarget(self, action: #selector(shareButtonTapped), for: .touchUpInside)
        return shareButton
    }
    
    private func makeCloseButton() -> NBPButton {
        let closeButton = NBPButton(image: .close)
        closeButton.addTarget(self, action: #selector(closeButtonTapped), for: .touchUpInside)
        return closeButton
    }
    
}
