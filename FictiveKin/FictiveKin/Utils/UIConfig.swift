//
//  UIConfig.swift
//  FictiveKin
//
//  Created by niv ben-porath on 02/07/2020.
//  Copyright © 2020 nbpApps. All rights reserved.
//

import UIKit

struct UIConfig {
    
    static func createFlowLayout() -> UICollectionViewFlowLayout {
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.sectionInset = UIEdgeInsets(top: 1, left: 5, bottom: 1, right: 5)
        flowLayout.minimumInteritemSpacing = 10
        return flowLayout
    }
    
    static func createCompositionalLayout() -> UICollectionViewCompositionalLayout {
                
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.5),
                                              heightDimension: .estimated(100))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0),
                                               heightDimension: .estimated(100))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
//        group.interItemSpacing = .fixed(15)     // item spacing
        
        let section = NSCollectionLayoutSection(group: group)
//        section.interGroupSpacing = 5     // group spacing
        
        let layout = UICollectionViewCompositionalLayout(section: section)
        return layout
    }
}

