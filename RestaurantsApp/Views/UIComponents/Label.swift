//
//  UILable.swift
//  RestaurantsApp
//
//  Created by Kumail kashefi on 05/03/2022.
//

import Foundation
import UIKit

class Label {
    
    static var sharedInstance = Label()
    private init(){}
    
    func getLabel() -> UILabel {
        let label = UILabel()
        label.textColor = .lightGray
        label.font = UIFont.systemFont(ofSize: 14)
        label.text = "Pizza"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }
}
