//
//  UIViewController+Utils.swift
//  FictiveKin
//
//  Created by niv ben-porath on 02/07/2020.
//  Copyright © 2020 nbpApps. All rights reserved.
//

import UIKit

extension UIViewController {
    
    func add(_ child : UIViewController,below shownView : UIView? = nil ,withPadding padding : CGFloat = 0.0) {
        addChild(child)
        child.view.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(child.view)
        
        if let belowShowView = shownView {
            child.view.topAnchor.constraint(equalTo: belowShowView.safeAreaLayoutGuide.bottomAnchor, constant: padding).isActive = true
        }else{
            child.view.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        }
        
        NSLayoutConstraint.activate([
            child.view.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            child.view.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            child.view.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
        
        child.didMove(toParent: self)
    }
    
    func remove() {
        guard parent != nil else {
            return
        }
        
        willMove(toParent: nil)
        view.removeFromSuperview()
        removeFromParent()
    }
    
}
