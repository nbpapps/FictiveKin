//
//  MainViewController.swift
//  FictiveKin
//
//  Created by niv ben-porath on 02/07/2020.
//  Copyright © 2020 nbpApps. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {
    @IBOutlet weak var actionButton: UIButton!
    
    //MARK: - life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    //MARK: - actions
    @IBAction func actionButtonTapped(_ sender: UIButton) {
        showSearchController()
    }
    
    @objc private func showSearchController() {
        let searchController = SearchViewController()
        navigationController?.pushViewController(searchController, animated: true)
    }
}
