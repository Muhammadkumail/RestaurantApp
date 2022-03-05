//
//  RestaurantViewModel.swift
//  RestaurantsApp
//
//  Created by Kumail kashefi on 05/03/2022.
//

import Foundation

class RestaurantViewModel {
    
    var delegate: Any!
    var restauarants: [Restuarants]?
    var viewController: RestaurantListViewController?
    
    init(controller: RestaurantListViewController) {
        self.delegate = controller
        bootStrap()
    }
    
    func bootStrap() {
        viewController =  (self.delegate as? RestaurantListViewController)
        getList()
    }
    
    func getList() {
        RestaurantInteractor.sharedInstance.getRestaurantList { response, error in
            self.restauarants = response ?? []
            self.viewController?.reloadCollectionView()
        }
    }
    
    func sortByDistance() {
        restauarants = restauarants?.sorted{$0.distance ?? 0.0 < $1.distance ?? 0.0}
        self.viewController?.reloadCollectionView()
    }
}
