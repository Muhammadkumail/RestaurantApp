//
//  URLConstant.swift
//  AmbitBox
//
//  Created by Syed Muneeb Ur Rehman on 10/11/2020.
//  Copyright © 2020 AvanzaSolutions. All rights reserved.
//

import Foundation

enum BuildEnvironment: String{
    case Live = "Live"
    case Staging = "Staging"
}

struct URLConstant {
    
    static func SetupEnvironment(type: BuildEnvironment = .Live) {
        Defaults.setEnvironment( type: type)
    }
    
    static func getBaseUrl() -> String {
        
        switch Defaults.getEnvironment() {
        case .Live: return URLConstant.BaseUrls.liveBaseUrl.rawValue
        case .Staging: return URLConstant.BaseUrls.StagingBaseUrl.rawValue
        default : return URLConstant.BaseUrls.liveBaseUrl.rawValue
        }
    }
    
    
    enum BaseUrls: String {
        case liveBaseUrl = "https://jahez-other-oniiphi8.s3.eu-central-1.amazonaws.com"
        case StagingBaseUrl = "https://staging.com/"
    }
    
    enum EndPoints : String , CaseIterable {
        case restaurantsList = "/restaurants.json"       
    }
    
}
