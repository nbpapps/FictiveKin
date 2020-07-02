//
//  MainViewController.swift
//  FictiveKin
//
//  Created by niv ben-porath on 02/07/2020.
//  Copyright © 2020 nbpApps. All rights reserved.
//

import UIKit

class MainViewController: UIViewController, UITextFieldDelegate {
    @IBOutlet weak var actionButton: UIButton!
    @IBOutlet weak var searchTextField: UITextField!
    
    //MARK: - life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configureView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        //        showSearchController(for: "car")
        configureViewAppearing()
    }
    
    //MARK: - configure
    private func configureView() {
        title = Texts.mainTitle
        let tap = UITapGestureRecognizer(target: self, action: #selector(userDidTapScreen))
        view.addGestureRecognizer(tap)
    }
    
    private func configureViewAppearing() {
        searchTextField.text = ""
        shouldHideTextFiled(false)
        searchTextField.becomeFirstResponder()
        
        shouldHideActionButton(true, withAnimation: false)
    }
    
    //MARK: - actions
    @IBAction func actionButtonTapped(_ sender: UIButton) {
        checkSearchText()
    }
    
    private func checkSearchText() {
        guard let searchText = searchTextField.text, !searchText.isEmpty else {
            showMissingTextMessage()
            return
        }
        shouldHideTextFiled(true)
        shouldHideActionButton(true, withAnimation: false)
        showSearchController(for: searchText)
    }
    
    private func showSearchController(for searchText : String) {
        let searchController = SearchViewController(imageListViewModel: ImageListViewModel(), searchText: searchText)
        navigationController?.pushViewController(searchController, animated: true)
    }
    
    @objc private func userDidTapScreen() {
        //we use a tap on the screen to select the text field
        searchTextField.becomeFirstResponder()
    }
    
    //MARK: - view update
    
    private func showMissingTextMessage() {
        searchTextField.resignFirstResponder()
        let messageViewController = MessageViewController(message: Texts.missingText)
        messageViewController.onDismissButtonTap = {
            messageViewController.remove()
        }
        add(messageViewController)
    }
    
    private func shouldHideTextFiled(_ hiddenState : Bool) {
        searchTextField.isHidden = hiddenState
    }
    
    private func shouldHideActionButton(_ hidden : Bool,withAnimation animate : Bool) {
        
        var alpha : CGFloat = 1.0
        var enabled = true
        var animationDuration : TimeInterval = 0.0
        
        if hidden {
            alpha = 0.0
            enabled = false
        }
         
        if animate {
            if hidden {
                animationDuration = 0.7
            }else{
                animationDuration = 1.3
            }
        }
        
        let animator = UIViewPropertyAnimator(duration: animationDuration , curve: .easeOut) {
            self.actionButton.alpha = alpha
            self.actionButton.isUserInteractionEnabled = enabled
        }
        animator.startAnimation()
    }
    
    
    
    //MARK: - text field
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        if let text = textField.text, !text.isEmpty {
            checkSearchText()
        }
        return true
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        guard let text = textField.text else {
            return true
        }
        
        if text.isEmpty {
            //in this case the text field was empty
            if string != "" {
                //and the user entered a string that is not "delete"
                shouldHideActionButton(false, withAnimation: true)
            }
        }
        else {
            //the text is not empty
            if text.count == 1 && string == "" {
                //there is only one character in the text field and the user erased it
                shouldHideActionButton(true, withAnimation: true)
            }
        }
        
        return true
    }
    
}
