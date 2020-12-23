//
//  SearchBySpecialty.swift
//  Seha Khanah
//
//  Created by Anas on 12/22/20.
//  Copyright © 2020 Anas. All rights reserved.
//

import Foundation
class SearchBySpecialtyPresenter {
    private let searchInteractor:SearchBySpecialtyInteractor
    private var searchedResults: [SearchBySpecialtyModel]
    private weak var view: SearchViewProtocol?
    init(view: SearchViewProtocol) {
        self.view = view
        self.searchInteractor = SearchBySpecialtyInteractor()
        searchedResults = [SearchBySpecialtyModel]()
    }
    
    func searchBy(specialty:String) {
        
        view?.showIndicator()
        searchInteractor.searchBy(specialty:specialty){ (result,error)  in
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
    func getAllspecialty() {
        
        view?.showIndicator()
        searchInteractor.getAllSpecialties{ (result,error)  in
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
    
    
    func configure(cell: SearchBySpeialtyTableViewCellView, for index: Int) {
        print(searchedResults.count)
        if searchedResults.count > 0{
            let searchedResult = searchedResults[index]
            
            cell.configure(result: searchedResult)
        }
        
    }
    
}
