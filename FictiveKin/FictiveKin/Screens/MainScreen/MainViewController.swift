//
//  MainViewController.swift
//  FictiveKin
//
//  Created by niv ben-porath on 02/07/2020.
//  Copyright © 2020 nbpApps. All rights reserved.
//

import UIKit

final class MainViewController: UIViewController {
    
    @IBOutlet weak var actionButton: UIButton!
    @IBOutlet weak var searchTextField: UITextField!
    @IBOutlet weak var searchTextFieldCenterConstraint: NSLayoutConstraint!
    
    private lazy var logicController = makeLogicController()
    
    //MARK: - life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configureView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        configureViewAppearing()
    }
    
    //MARK: - configure
    private func configureView() {
        title = Texts.mainTitle
        let tap = UITapGestureRecognizer(target: self, action: #selector(userDidTapScreen))
        view.addGestureRecognizer(tap)
        if UIDevice.current.screenType == .iPhones_5_5s_5c_SE {
            searchTextFieldCenterConstraint.constant = Constraints.keyboardAdjustment
            UIView.animate(withDuration: 0.2) {
                self.view.layoutIfNeeded()
            }
        }
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
        let searchController = SearchViewController(imageListViewModel: ImageListViewModel(searchText: searchText))
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
        let animatorProperties = logicController.shouldHideActionButton(hidden, withAnimation: animate)
        let animator = UIViewPropertyAnimator(duration: animatorProperties.animationDuration , curve: .easeOut) {
            self.actionButton.alpha = animatorProperties.alpha
            self.actionButton.isUserInteractionEnabled = animatorProperties.enabled
        }
        animator.startAnimation()
    }
    
    //MARK: - factory
    private func makeLogicController() -> MainScreenLogicController {
        return MainScreenLogicController()
    }
}

extension MainViewController : UITextFieldDelegate {
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
        
        if let textFieldEmpty = logicController.textFieldIsEmpty(with: text, andAdded: string) {
            shouldHideActionButton(textFieldEmpty, withAnimation: true)
        }
        
        return true
    }
}
