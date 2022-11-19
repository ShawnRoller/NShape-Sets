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
        guard let defaults = UserDefaults(suiteName: Constants.appGroup) else { return }
        defaults.set(value, forKey: key)
    }
    
    static func getDefault(forKey key: String) -> Any? {
        guard let defaults = UserDefaults(suiteName: Constants.appGroup) else { return nil }
        let value = defaults.object(forKey: key)
        return value
    }
}
