//
//  ImagesCollectionViewDataSource.swift
//  FictiveKin
//
//  Created by niv ben-porath on 02/07/2020.
//  Copyright © 2020 nbpApps. All rights reserved.
//

import UIKit

final class ImagesCollectionViewDataSource : NSObject, UICollectionViewDataSource {
    
    let imageListViewModel : ImageListViewModel
    
    //MARK: - init
    init(imageListViewModel : ImageListViewModel) {
        self.imageListViewModel = imageListViewModel
    }
    
    //MARK: - UICollectionViewDataSource
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return imageListViewModel.numberOfImages
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ImageCell.reuseId, for: indexPath) as? ImageCell else {
            preconditionFailure("incorrect cell")
        }
        
        let imageInfo = imageListViewModel.image(at: indexPath.row)
       
        cell.setupCell(with: imageInfo.user, and: URL(string:imageInfo.previewURL))
        
        return cell
    }
    
}
