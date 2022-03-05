//
//  RaastNetworkService.swift
//  AmbitBox
//
//  Created by Kumail kashefi on 16/07/2021.
//  Copyright © 2021 AvanzaSolutions. All rights reserved.
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
