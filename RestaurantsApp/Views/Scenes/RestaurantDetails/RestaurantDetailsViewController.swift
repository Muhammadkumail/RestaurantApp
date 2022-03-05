//
//  RestaurantDetailsViewController.swift
//  RestaurantsApp
//
//  Created by Kumail kashefi on 05/03/2022.
//

import UIKit

class RestaurantDetailsViewController: UIViewController {

    var restauarant: Restuarants?
    var viewModel: RestaurantDetailsViewModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setupData()
    }
    
    
    func setupData()  {
        viewModel = RestaurantDetailsViewModel.init(controller: self)
    }
    
    func setupView() {
        
    }

}
