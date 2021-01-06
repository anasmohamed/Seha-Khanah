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
                    print("final result\(result?.count)")
                    if (result!.count == 0)
                    {self.view?.showNoDataFoundImage()
                        
                    }else{
                        self.searchedResults = result!
                        self.view?.searchResults()
                    }}
                
            }
            
        }
    }
    public func searchResultCount() -> Int {
        return searchedResults.count
    }
    func getDoctorId(index:Int) -> String {
        return searchedResults[index].id!
    }
    
    func configure(cell: SearchedResultsTableViewCellView, for index: Int) {
        print(searchedResults.count)
        if searchedResults.count > 0{
            let searchedResult = searchedResults[index]
            
            cell.configure(result: searchedResult)
        }
        
    }
    
}
