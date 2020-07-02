//
//  UIScrollView+Utils.swift
//  FictiveKin
//
//  Created by niv ben-porath on 02/07/2020.
//  Copyright © 2020 nbpApps. All rights reserved.
//

import UIKit

extension UIScrollView {
    
    static let pointCheckBeforeFullOffset : CGFloat = 50
    
    func didReachEndOfList() -> Bool {
        let offsetY = self.contentOffset.y
        let contentHeight = self.contentSize.height
        let height = self.frame.size.height
        
        if offsetY - UIScrollView.pointCheckBeforeFullOffset > contentHeight - height {
            return true
        }else{
            return false
        }
    }
}
