//
//  NBPImageView.swift
//  FictiveKin
//
//  Created by niv ben-porath on 02/07/2020.
//  Copyright © 2020 nbpApps. All rights reserved.
//

import UIKit
import Kingfisher

final class NBPImageView: UIImageView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError(Texts.noStoryboard)
    }
    
    public init(cornerRadius : CGFloat) {
        super.init(frame: .zero)
        layer.cornerRadius = cornerRadius
        configure()
    }
    
    private func configure() {
        clipsToBounds = true
        translatesAutoresizingMaskIntoConstraints = false
    }
    
    func showImage(at url : URL) {
        self.kf.setImage(with: url)
    }
    
    func cancelDownload() {
        self.kf.cancelDownloadTask()
    }
    
}
