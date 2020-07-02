//
//  SearchViewController.swift
//  FictiveKin
//
//  Created by niv ben-porath on 02/07/2020.
//  Copyright © 2020 nbpApps. All rights reserved.
//

import UIKit

final class SearchViewController: UIViewController {
    
    private lazy var logicController = makeLogicController()
    private lazy var loadingViewController = makeLoadingViewController()
    private lazy var imageGridViewController = makeImageGridController()
    
    let imageListViewModel : ImageListViewModel
    let searchText : String
    
    //MARK: - life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configureView()
        renderScreen(for: .loading)
        createSearchRequest()
    }
    
    
    //MARK: - init
    init(imageListViewModel : ImageListViewModel,searchText : String) {
        self.imageListViewModel = imageListViewModel
        self.searchText = searchText
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError(Texts.noStoryboard)
    }
    
    //MARK: - configure view
    private func configureView() {
        view.backgroundColor = .mainColor
        title = searchText
    }
    
    //MARK: - create search request
    private func createSearchRequest() {
        logicController.newSearchRequest(for: searchText) { [weak self] (state) in
            guard let self = self else {return}
            self.renderScreen(for: state)
        }
    }
    
    //MARK: - state render
    private func renderScreen(for state : SearchDisplayState) {
        switch state {
        case .noResults:
            removeLoading()
            showMessageView(with: Texts.noResults)
            
        case .loading:
            showLoading()
            
        case .presenting:
            removeLoading()
            showImageGrid()
            
        case .generalError:
            removeLoading()
            showMessageView(with: Texts.somethingWentWrong)
        }
    }
    
    
    //MARK: - state update
    private func showImageGrid() {
        add(imageGridViewController)
    }
    
    private func removeImageGrid() {
        imageGridViewController.remove()
    }
    
    private func showLoading() {
        view.alpha = 0.7
        add(loadingViewController)
    }
    
    private func removeLoading() {
        view.alpha = 1.0
        loadingViewController.remove()
    }
    
    private func showMessageView(with messageText : String) {
        let messageViewController = MessageViewController(message: messageText)
        messageViewController.onDismissButtonTap = {
            messageViewController.remove()
            self.navigateBackToMainScreen()
        }
        add(messageViewController)
    }
    
    private func navigateBackToMainScreen() {
        navigationController?.popViewController(animated: true)
    }
    
    
    //MARK: - factory
    private func makeLogicController() -> SearchLogicController {
        return SearchLogicController(imageListViewModel: imageListViewModel)
    }
    
    private func makeLoadingViewController() -> LoadingViewController {
        return LoadingViewController()
    }
    
    private func makeImageGridController() -> ImageGridViewController {
        return ImageGridViewController(imageListViewModel: imageListViewModel)
    }
    
}
