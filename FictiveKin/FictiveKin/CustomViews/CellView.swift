//
//  CellView.swift
//  FictiveKin
//
//  Created by niv ben-porath on 02/07/2020.
//  Copyright © 2020 nbpApps. All rights reserved.
//

import UIKit

final class CellView: UIView {
    
    let imageView = NBPImageView(cornerRadius: UIImageView.imageCornerRadius)
    
    override init(frame : CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError(Texts.noStoryboard)
    }
    
    private func configure() {
        
        addSubview(imageView)
        self.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            imageView.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            imageView.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            imageView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            imageView.trailingAnchor.constraint(equalTo: self.trailingAnchor)
        ])
    }
    
    func setup(with url : URL?) {
        if let imageURL = url {
            imageView.showImage(at: imageURL)
        }
    }
    
    func cancelDownload() {
        imageView.cancelDownload()
        imageView.image = nil
    }
    
}
