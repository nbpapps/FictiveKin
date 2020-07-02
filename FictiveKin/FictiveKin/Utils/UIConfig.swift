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
        
        var screenCoefficient : CGFloat = 1
        if UIDevice.current.screenType == .iPhones_5_5s_5c_SE {
            screenCoefficient = 4
        }
        
        let itemSize = NSCollectionLayoutSize(widthDimension: .estimated(UICollectionView.dimensionEstimation),
                                              heightDimension: .estimated(UICollectionView.dimensionEstimation))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(UICollectionView.fullFractionalDimension),
                                               heightDimension: .estimated(UICollectionView.dimensionEstimation))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
        group.interItemSpacing = .flexible(UICollectionView.itemSpacing/screenCoefficient)
        group.contentInsets = NSDirectionalEdgeInsets(top: UICollectionView.contentInsetsVertical, leading: UICollectionView.contentInsetsHorizontal/screenCoefficient, bottom: UICollectionView.contentInsetsVertical, trailing: UICollectionView.contentInsetsHorizontal/screenCoefficient)
        
        let section = NSCollectionLayoutSection(group: group)
        let layout = UICollectionViewCompositionalLayout(section: section)
        return layout
    }
}

