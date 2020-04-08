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
        let minutes = seconds / 60 % 60
        let seconds = seconds % 60
        let time = String(format:"%02i:%02i", minutes, seconds)
        return time
    }
    
}
