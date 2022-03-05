//
//  RaastInteractor.swift
//  AmbitBox
//
//  Created by Kumail kashefi on 16/07/2021.
//  Copyright © 2021 AvanzaSolutions. All rights reserved.
//

import Foundation
class RestaurantInteractor {
    
    static var sharedInstance = RestaurantInteractor()
    private init(){}
    
    func getRestaurantList(_ callback: @escaping((_ response: [Restuarants]?, _ error: String?) -> Void) ){
        
        RestaurantNetworkService.getRestaurantListRequest(URLConstant.EndPoints.restaurantsList.rawValue) { result in
            switch result{
            case .success(let response):
                callback(response, nil)
                
            case .failure(let error):
                print(error)
                callback(nil, error.localizedDescription)
            }
        }
    }
}
