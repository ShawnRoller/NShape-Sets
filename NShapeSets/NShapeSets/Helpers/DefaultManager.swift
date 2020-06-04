//
//  DefaultManager.swift
//  NShapeSets
//
//  Created by Shawn Roller on 6/4/20.
//  Copyright © 2020 offensively-bad. All rights reserved.
//

import Foundation

struct DefaultManager {
    static func setDefault(value: Any, forKey key: String) {
        let defaults = UserDefaults.standard
        defaults.set(value, forKey: key)
    }
    
    static func getDefault(forKey key: String) -> Any? {
        let defaults = UserDefaults.standard
        let value = defaults.object(forKey: key)
        return value
    }
}
