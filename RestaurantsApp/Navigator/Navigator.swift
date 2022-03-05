//
//  Navigator.swift
//  RestaurantsApp
//
//  Created by Kumail kashefi on 05/03/2022.
//

import Foundation
import UIKit

class Navigator {
    
    static var sharedInstance = Navigator()
    private init(){}
    
    func navigateToRestaurantList(_ controller: UIViewController) {
        let rooVC = RestaurantListViewController()
        let navVC = UINavigationController.init(rootViewController: rooVC)
        navVC.modalPresentationStyle = .fullScreen
        controller.present(navVC, animated: true)
    }
    
    func navigateToRestaurantDetailsView(data: Restuarants, controller: RestaurantListViewController) {
        
        let vc = RestaurantDetailsViewController()
        vc.title = "\(data.name ?? "")"
        vc.view.backgroundColor = .white
        vc.restauarant = data
        controller.navigationController?.pushViewController(vc, animated: true)
        
    }
}
