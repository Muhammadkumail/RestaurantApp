//
//  RestaurantDetailsViewModel.swift
//  RestaurantsApp
//
//  Created by Kumail kashefi on 05/03/2022.
//

import Foundation

class RestaurantDetailsViewModel {
    
    var delegate: Any!
    var viewController: RestaurantDetailsViewController?
    
    init(controller: RestaurantDetailsViewController) {
        self.delegate = controller
        bootStrap()
    }
    
    func bootStrap() {
        viewController =  (self.delegate as? RestaurantDetailsViewController)
        updateUI()
    }
    
    func updateUI() {
        print(viewController?.restauarant as Any)
    }
}
