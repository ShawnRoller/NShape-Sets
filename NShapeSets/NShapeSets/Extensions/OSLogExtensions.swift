//
//  OSLogExtensions.swift
//  NShapeSets
//
//  Created by Shawn Roller on 6/10/20.
//  Copyright © 2020 offensively-bad. All rights reserved.
//

import Foundation
import os

extension OSLog {
    private static var subsystem = Bundle.main.bundleIdentifier!

    static let ui = OSLog(subsystem: subsystem, category: "UI")
    static let healthKit = OSLog(subsystem: subsystem, category: "HealthKit")
}
