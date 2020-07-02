//
//  NBPButton.swift
//  FictiveKin
//
//  Created by niv ben-porath on 02/07/2020.
//  Copyright © 2020 nbpApps. All rights reserved.
//

import UIKit

final class NBPButton: UIButton {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        //this is the init for story board
        fatalError("Storyboard not implemented")
    }
    
    
    public init(backgroundColor : UIColor = .clear,title : String = "",borderColor : UIColor = .clear,image : UIImage? = nil,tintColor : UIColor = .textColor) {
        super.init(frame: .zero)
        self.backgroundColor = backgroundColor
        self.setTitle(title, for: .normal)
        self.setImage(image, for: .normal)
        self.imageView?.tintColor = tintColor
        self.layer.borderColor = borderColor.cgColor
        configure()
    }
    
    private func configure() {
        layer.cornerRadius = 10
        layer.borderWidth = 2.0
        setTitleColor(.label, for: .normal)
        titleLabel?.font = UIFont.preferredFont(forTextStyle: .headline) //this is for dynamic type
        translatesAutoresizingMaskIntoConstraints = false //this will let us use AutoLayout
    }
}
