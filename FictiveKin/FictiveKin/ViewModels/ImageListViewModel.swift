//
//  ImageListViewModel.swift
//  FictiveKin
//
//  Created by niv ben-porath on 02/07/2020.
//  Copyright © 2020 nbpApps. All rights reserved.
//

import Foundation

enum SearchError : Error {
    case generalServerError
    case noResults
}

class ImageListViewModel {

    private var imageList = [Image]()
    private var searchText = ""
    private var page = 1

    var numberOfImages : Int {
        imageList.count
    }
    
    func image(at index : Int) -> Image {
        return imageList[index]
    }
    
    private func resetImages() {
        imageList.removeAll()
        searchText = ""
        page = 1
    }
}

extension ImageListViewModel {
    //MARK: - fetching data
    func createNewSearch(for searchText : String, with completion : @escaping (SearchError?) -> Void) {
        resetImages()
        self.searchText = searchText
        self.fetchImages { (error) in
            completion(error)
        }
    }
    
    func showNextPage(with completion : @escaping (SearchError?)->Void) {
        page += 1
        self.fetchImages { (error) in
            if let _ = error {
                completion(.generalServerError)
            }else{
                completion(nil)
            }
        }
    }
    
    
    private func fetchImages(with completion : @escaping (SearchError?)->Void) {
        let dataFetch = DataFetching()
        dataFetch.requestImages(for: searchText, at: page) {[weak self] (result) in
            guard let self = self else {return}
            switch result {
            case .success(let fullResponse):
                self.updateImagesList(from: fullResponse)
                if fullResponse.totalHits == 0 { //in case we don't get back any images
                    self.resetImages()
                    completion(.noResults)
                }else{
                    completion(nil)
                }
                
            case .failure(let error):
                print(error)
                completion(.generalServerError)
            }
        }
    }
    
    private func updateImagesList(from fullResponse : FullResponse) {
        let images = fullResponse.hits
        imageList.append(contentsOf: images)
    }
    
}
