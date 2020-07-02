//
//  MessageViewController.swift
//  FictiveKin
//
//  Created by niv ben-porath on 02/07/2020.
//  Copyright © 2020 nbpApps. All rights reserved.
//

import UIKit

class MessageViewController: UIViewController {
    
    var onDismissButtonTap : () -> () = {}
    
    let message : String
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(white: 0.0, alpha: 0.8)
        configureMessageLabel()
    }
    
    init(message : String) {
        self.message = message
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureMessageLabel() {
        let messageLabel = UILabel(frame: .zero)
        messageLabel.numberOfLines = 0
        messageLabel.textAlignment = .center
        messageLabel.font = UIFont(name: "Hoefler Text", size: 25.0)
        messageLabel.textColor = .textColor
        
        messageLabel.text = message

        
        let dismissButton = UIButton(frame: .zero)
        dismissButton.setTitle(Texts.dismiss, for: .normal)
        dismissButton.setTitleColor(.textColor, for: .normal)
        dismissButton.layer.borderWidth = 1.0
        dismissButton.layer.borderColor = UIColor.textColor.cgColor
        dismissButton.layer.cornerRadius = 5.0
        dismissButton.addTarget(self, action: #selector(dismissButtonTapped), for: .touchUpInside)
        
        view.addSubview(messageLabel)
        view.addSubview(dismissButton)

        messageLabel.translatesAutoresizingMaskIntoConstraints = false
        dismissButton.translatesAutoresizingMaskIntoConstraints = false

        
        NSLayoutConstraint.activate([
            messageLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            messageLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            messageLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: Constraints.padding),
            messageLabel.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -Constraints.padding),
            
            dismissButton.topAnchor.constraint(equalTo: messageLabel.bottomAnchor, constant: Constraints.padding),
            dismissButton.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: Constraints.padding),
            dismissButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -Constraints.padding),
            dismissButton.heightAnchor.constraint(equalToConstant: 50)
            
        ])
    }
    
    @objc private func dismissButtonTapped() {
        onDismissButtonTap()
    }
    
    
}
