//
//  NavigationBar.swift
//  RestaurantsApp
//
//  Created by Kumail kashefi on 05/03/2022.
//

import Foundation
import UIKit

class NavigationBar {
    
    static var sharedInstance = NavigationBar()
    private init(){}
    
    func setupNavigationController(nav: UINavigationController?) {
        let appearance = UINavigationBarAppearance()
        appearance.backgroundColor = .orange
        appearance.shadowImage = nil
        appearance.backgroundImage = nil
        nav?.navigationBar.standardAppearance = appearance;
        nav?.navigationBar.scrollEdgeAppearance = nav?.navigationBar.standardAppearance
    }
}
