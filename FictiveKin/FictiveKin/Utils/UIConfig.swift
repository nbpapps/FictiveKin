//
//  UIConfig.swift
//  FictiveKin
//
//  Created by niv ben-porath on 02/07/2020.
//  Copyright © 2020 nbpApps. All rights reserved.
//

import UIKit

struct UIConfig {
    
    static func createCompositionalLayout() -> UICollectionViewCompositionalLayout {
        
        let itemSize = NSCollectionLayoutSize(widthDimension: .estimated(UICollectionView.dimensionEstimation),
                                              heightDimension: .estimated(UICollectionView.dimensionEstimation))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(UICollectionView.fullFractionalDimension),
                                               heightDimension: .estimated(UICollectionView.dimensionEstimation))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
        group.interItemSpacing = .flexible(UICollectionView.itemSpacing)
        group.contentInsets = NSDirectionalEdgeInsets(top: UICollectionView.contentInsetsVertical, leading: UICollectionView.contentInsetsHorizontal, bottom: UICollectionView.contentInsetsVertical, trailing: UICollectionView.contentInsetsHorizontal)
        let section = NSCollectionLayoutSection(group: group)
        let layout = UICollectionViewCompositionalLayout(section: section)
        return layout
    }
}

