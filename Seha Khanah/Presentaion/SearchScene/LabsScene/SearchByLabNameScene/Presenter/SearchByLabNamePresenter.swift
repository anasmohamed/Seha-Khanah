//
//  SearchByLabNamePresenter.swift
//  Seha Khanah
//
//  Created by Anas on 12/25/20.
//  Copyright © 2020 Anas. All rights reserved.
//

import Foundation
class SearchByLabNamePresenter {
    private let searchByLabNameInteractor:SearchByLabNameInteractor
    private var labs: [Lab]
    private weak var view: SearchByLabNameProtocol?
    init(view: SearchByLabNameProtocol) {
        self.view = view
        self.searchByLabNameInteractor = SearchByLabNameInteractor()
        labs = [Lab]()
    }
    
    func searchByLab(name:String) {
        
        view?.showIndicator()
        searchByLabNameInteractor.searchByLabName(name: name){ (result,error)  in
            if let error = error {
                print("errrror\(error)")
                self.view?.showError(error: error.localizedDescription)
            } else {
                if result != nil{
                    print("final result\(result?.count)")
                    if (result!.count == 0)
                    {self.view?.showNoDataFoundImage()
                        
                    }else{
                        self.labs = result!
                        self.view?.labsResults()
                    }}
                
            }
            
        }
    }
    
    public func labsCount() -> Int {
        return labs.count
    }
    
    
    func configure(cell: SearchByLabNameTableViewCellProtocol, for index: Int) {
        print(labs.count)
        if labs.count > 0{
            let lab = labs[index]
            
            cell.configure(lab: lab)
        }
        
    }
}
