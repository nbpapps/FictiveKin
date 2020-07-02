//
//  SearchLogicController.swift
//  FictiveKin
//
//  Created by niv ben-porath on 02/07/2020.
//  Copyright © 2020 nbpApps. All rights reserved.
//

import Foundation

enum SearchDisplayState {
    case noResults
    case loading
    case presenting
    case generalError
}

struct SearchLogicController {
    let imageListViewModel : ImageListViewModel
    
    //MARK: - init
    init(imageListViewModel : ImageListViewModel) {
        self.imageListViewModel = imageListViewModel
    }
    
    //MARK: - search request logic
    func newSearchRequest(with completion : @escaping (SearchDisplayState) -> Void) {
        imageListViewModel.createNewSearch { (error) in
            DispatchQueue.main.async {
                if let searchError = error {
                    switch searchError {
                    case .generalServerError:
                        completion(.generalError)
                    case .noResults:
                        completion(.noResults)
                    }
                }else{
                    completion(.presenting)
                }
            }
        }
    }
    
}
