//
//  SearchViewController.swift
//  FictiveKin
//
//  Created by niv ben-porath on 02/07/2020.
//  Copyright © 2020 nbpApps. All rights reserved.
//

import UIKit

class SearchViewController: UIViewController {

    private lazy var logicController = makeLogicController()

    let imageListViewModel : ImageListViewModel

    //MARK: - life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .red
        // Do any additional setup after loading the view.
    }
    
    //MARK: - init
    init(imageListViewModel : ImageListViewModel) {
        self.imageListViewModel = imageListViewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    //MARK: - factory
    private func makeLogicController() -> SearchLogicController {
        return SearchLogicController(
    }

}
