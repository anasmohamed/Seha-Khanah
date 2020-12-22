//
//  SearchPresenter.swift
//  Seha Khanah
//
//  Created by Anas on 12/22/20.
//  Copyright © 2020 Anas. All rights reserved.
//

import Foundation
class SearchPresenter {
    private let searchInteractor:SearchByNameInteractor
    private var searchedResults: [SearchedResults]
    private weak var view: SearchViewProtocol?
    init(view: SearchViewProtocol) {
        self.view = view
        self.searchInteractor = SearchByNameInteractor()
        searchedResults = [SearchedResults]()
    }
    
    func searchBy(name:String) {
        
        view?.showIndicator()
        searchInteractor.searchBy(name:name){ (result,error)  in
            if let error = error {
                print("errrror\(error)")
                self.view?.showError(error: error.localizedDescription)
            } else {
                if result != nil{
                    self.searchedResults = result!
                    self.view?.searchResults()
                }
                
            }
            
        }
    }
    public func searchResultCount() -> Int {
        return searchedResults.count
    }
    
    
    func configure(cell: SearchedResultsTableViewCellView, for index: Int) {
        print(searchedResults.count)
        if searchedResults.count > 0{
            let searchedResult = searchedResults[index]
            guard let image = searchedResult.photo,
                let name = searchedResult.nameEn
                else{
                    return
            }
            cell.configure(image:image , name: name)
        }
        
    }
    
}
