//
//  UIScrollView+Utils.swift
//  FictiveKin
//
//  Created by niv ben-porath on 02/07/2020.
//  Copyright © 2020 nbpApps. All rights reserved.
//

import UIKit

extension UIScrollView {
    func didReachEndOfList() -> Bool {
        let offsetY = self.contentOffset.y
        let contentHeight = self.contentSize.height
        let height = self.frame.size.height
        
        if offsetY > contentHeight - height {
            return true
        }else{
            return false
        }
    }
}
