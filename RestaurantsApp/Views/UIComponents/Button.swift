//
//  Button.swift
//  RestaurantsApp
//
//  Created by Kumail kashefi on 05/03/2022.
//

import Foundation
import UIKit

class Button {
    
    static var sharedInstance = Button()
    private init(){}
    
    func getButton() -> UIButton {
        let button = UIButton()
        button.backgroundColor = UIColor.red
        button.layer.cornerRadius = 10
        button.clipsToBounds = true
        button.setTitle("Check Details", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }
}
