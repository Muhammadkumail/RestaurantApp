//
//  RestaurantDetailsViewModel.swift
//  RestaurantsApp
//
//  Created by Kumail kashefi on 05/03/2022.
//

import Foundation
import UIKit

class RestaurantDetailsViewModel {
    
    var delegate: Any!
    var restaurant: Restuarants?
    var viewController: RestaurantDetailsViewController?
    
    init(controller: RestaurantDetailsViewController, data: Restuarants?) {
        self.delegate = controller
        self.restaurant = data
        bootStrap()
    }
    
    func bootStrap() {
        viewController =  (self.delegate as? RestaurantDetailsViewController)
        updateUI()
    }
    
    func updateUI() {
        viewController?.nameLabel.text = restaurant?.name ?? "N/A"
        viewController?.discriptionLabel.text = restaurant?.description ?? "N/A"
        viewController?.hoursLabel.text = restaurant?.hours ?? "N/A"
        viewController?.ratingLabel.text = "\(restaurant?.rating ?? 0.0)"
        ImageView.sharedInstance.setImage(urlString: restaurant?.image, imageView: viewController?.restaurantImageView ?? UIImageView())
    }
}
