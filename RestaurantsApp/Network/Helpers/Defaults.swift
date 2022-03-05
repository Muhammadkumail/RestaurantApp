//
//  Defaults.swift
//  RestaurantsApp
//
//  Created by Kumail kashefi on 05/03/2022.
//

import Foundation

struct Defaults{
    
    static let environmetType   = "environmetType"
    
    // MARK: - Environment Type
    
    static func setEnvironment(type: BuildEnvironment) {
        UserDefaults.standard.set(type.rawValue, forKey: environmetType )
    }
    static func getEnvironment() -> BuildEnvironment? {
        if let environmentTypeRawValue = UserDefaults.standard.object(forKey: environmetType) as? String {
            return BuildEnvironment(rawValue: environmentTypeRawValue)
        }
        return nil
    }
    
}
