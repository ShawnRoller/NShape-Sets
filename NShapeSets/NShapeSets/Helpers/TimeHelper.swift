//
//  TimeHelper.swift
//  NShapeSets
//
//  Created by Shawn Roller on 3/28/20.
//  Copyright © 2020 offensively-bad. All rights reserved.
//

import Foundation

struct TimeHelper {
    
    static func getTimeFromSeconds(_ seconds: Int) -> String {
        let minutes = floor(Double(seconds) / 60)
        let seconds = seconds % 60
        let time = String(format: "%02d:%02d", minutes, seconds)
        return time
    }
    
}
