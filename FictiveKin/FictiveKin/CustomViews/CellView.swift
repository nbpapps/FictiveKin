//
//  CellView.swift
//  FictiveKin
//
//  Created by niv ben-porath on 02/07/2020.
//  Copyright © 2020 nbpApps. All rights reserved.
//

import UIKit

class CellView: UIView {
    
    let imageView = NBPImageView(cornerRadius: 20)
    let userInfoLabel = NBPLabel(textAlignment: .center, fontSize: 20.0, weight: .regular, color: .textColor)
    
    override init(frame : CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configure() {
        let stackView = UIStackView(arrangedSubviews: [imageView,userInfoLabel])
        stackView.axis = .vertical
        stackView.distribution = .equalCentering
        stackView.alignment = .center
        stackView.translatesAutoresizingMaskIntoConstraints = false
        self.translatesAutoresizingMaskIntoConstraints = false
        self.layer.borderColor = UIColor.textColor.cgColor
        self.layer.borderWidth = 1.0
        self.layer.cornerRadius = 7.0
        addSubview(stackView)
        
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: self.topAnchor, constant: Constraints.padding),
            stackView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: Constraints.padding),
            stackView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -Constraints.padding),
            stackView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -Constraints.padding)
        ])
    }
    
    func setup(with userInfo : String,and url : URL?) {
        if let imageURL = url {
            imageView.showImage(at: imageURL)
        }
        userInfoLabel.text = userInfo
    }
    
    func cancelDownload() {
        imageView.cancelDownload()
        imageView.image = nil
    }
    
}
