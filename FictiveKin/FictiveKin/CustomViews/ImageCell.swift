//
//  ImageCell.swift
//  FictiveKin
//
//  Created by niv ben-porath on 02/07/2020.
//  Copyright © 2020 nbpApps. All rights reserved.
//

import UIKit

class ImageCell: UICollectionViewCell {
    static let reuseId = Texts.imageCellId
    
    let cellView = CellView(frame: .zero)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("no storyboard")
    }
    
    private func configure() {
        backgroundColor = .clear
        contentView.backgroundColor = .clear
        
        contentView.translatesAutoresizingMaskIntoConstraints = false
        self.translatesAutoresizingMaskIntoConstraints = false
        addSubview(cellView)
        
        NSLayoutConstraint.activate([
            
            contentView.leadingAnchor.constraint(equalTo: leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: trailingAnchor),
            contentView.topAnchor.constraint(equalTo: topAnchor),
            contentView.bottomAnchor.constraint(equalTo: bottomAnchor),
            
            cellView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            cellView.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),

            cellView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            cellView.heightAnchor.constraint(equalTo:  contentView.heightAnchor),
            cellView.widthAnchor.constraint(lessThanOrEqualTo: contentView.widthAnchor)
        ])
    }
    
    func setupCell(with userInfo : String,and url : URL? = nil) {
        cellView.setup(with: userInfo, and: url)
    }
    
    //this is how we "reset" images in the cell when it gets the prepareForReuse call
    override func prepareForReuse() {
        super.prepareForReuse()
        cellView.cancelDownload()
    }
    
}
