//
//  MostOrderedOffersTableViewCellView.swift
//  Seha Khanah
//
//  Created by Anas on 12/21/20.
//  Copyright © 2020 Anas. All rights reserved.
//

import Foundation
protocol MostOrderedOffersTableViewCellView:class {
    func configure(mostOrderedOffer : MostOrderedOffers)
    func configureWithOfferDetails(offerDetails : OfferDetails)

}
