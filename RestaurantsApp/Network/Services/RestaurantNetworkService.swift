//
//  RestaurantNetworkService.swift
//  RestaurantsApp
//
//  Created by Kumail kashefi on 05/03/2022.
//

import Foundation

class RestaurantNetworkService {
    
    static let requestManager = RequestManager.shared
    
    public static func getRestaurantListRequest(_ endPoint: String,completion: @escaping (_ result: Result<[Restuarants]>)->Void){
        
        let url = "\(URLConstant.getBaseUrl())\(endPoint)"
        
        requestManager.request(url: url) { response in
            completion(response)
        }
    }
}
