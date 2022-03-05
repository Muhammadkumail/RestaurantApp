//
//  Defaults.swift
//  AmbitBox
//
//  Created by Ali Akber Motorwala on 19/03/2019.
//  Copyright © 2019 AvanzaSolutions. All rights reserved.
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
