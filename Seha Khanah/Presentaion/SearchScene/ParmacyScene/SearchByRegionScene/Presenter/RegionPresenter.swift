//
//  RegionPresenter.swift
//  Seha Khanah
//
//  Created by Anas on 12/24/20.
//  Copyright © 2020 Anas. All rights reserved.
//

import Foundation
class RegionPresenter {
    private let regionInteractor:RegionInteractor
    private var areas: [Area]
    private weak var view: AreasProtocol?
    init(view: AreasProtocol) {
        self.view = view
        self.regionInteractor = RegionInteractor()
        areas = [Area]()
    }
    
    func getAreas() {
        
        view?.showIndicator()
        regionInteractor.getAreas{ (result,error)  in
            if let error = error {
                print("errrror\(error)")
                self.view?.showError(error: error.localizedDescription)
            } else {
                if result != nil{
                    print("final result\(result?.count)")
                    if (result!.count == 0)
                    {self.view?.showNoDataFoundImage()
                        
                    }else{
                        self.areas = result!
                        self.view?.pharamcyOffersResults()
                    }}
                
            }
            
        }
    }
    
    public func areasCount() -> Int {
        return areas.count
    }
    public func getAreasList() -> [Area]
    {
        return areas
    }
    
//    func configure(cell: PharmacyOfferTableViewCellViewProtocol, for index: Int) {
//        print(areas.count)
//        if areas.count > 0{
//            let pharmacyOffer = areas[index]
//            cell.configure(offer: areas)
//        }
//
//    }
}
