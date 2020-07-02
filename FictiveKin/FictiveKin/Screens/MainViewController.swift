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
        searchTextField.becomeFirstResponder()
        shouldHideUI(false)
        searchTextField.text = ""
    }
    
    //MARK: - configure
    private func configureView() {
        
    }
    
    //MARK: - actions
    @IBAction func actionButtonTapped(_ sender: UIButton) {
        userDidTapActionButton()
    }
    
    private func userDidTapActionButton() {
        guard let searchText = searchTextField.text, !searchText.isEmpty else {
            //show error screen
            return
        }
        shouldHideUI(true)
        showSearchController(for: searchText)
    }
    
    private func showSearchController(for searchText : String) {
        let searchController = SearchViewController(imageListViewModel: ImageListViewModel(), searchText: searchText)
        navigationController?.pushViewController(searchController, animated: true)
    }
    
    private func shouldHideUI(_ hiddenState : Bool) {
        searchTextField.isHidden = hiddenState
        actionButton.isHidden = hiddenState
    }
    
    //MARK: - text field
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
}
