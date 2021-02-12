//
//  HapticHelper.swift
//  NShapeSets
//
//  Created by Shawn Roller on 2/27/20.
//  Copyright © 2020 offensively-bad. All rights reserved.
//

import Foundation
import WatchKit

struct HapticHelper {
    static func playCountdownHaptic() {
        WKInterfaceDevice.current().play(.start)
    }
    
    static func playStartHaptic() {
        WKInterfaceDevice.current().play(.success)
    }
}
