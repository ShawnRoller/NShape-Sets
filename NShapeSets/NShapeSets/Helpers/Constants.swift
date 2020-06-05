//
//  Constants.swift
//  NShapeSets
//
//  Created by Shawn Roller on 12/13/19.
//  Copyright © 2019 offensively-bad. All rights reserved.
//

import UIKit
import SwiftUI

struct Theme {
    static let settingsFont = UIFont(name: "Gotham-Book", size: 36)
    static let header1Font = UIFont(name: "Gotham-Book", size: 60)
    static let header2Font = UIFont(name: "Gotham-Book", size: 45)
    
    static let wTypeFont = UIFont.systemFont(ofSize: 20, weight: .regular)
    static let wSettingsFont = UIFont.systemFont(ofSize: 26, weight: .regular)
    static let wHeader1Font = UIFont.systemFont(ofSize: 38, weight: .regular)
    static let wHeader2Font = UIFont.systemFont(ofSize: 20, weight: .regular)
    static let wHeader3Font = UIFont.systemFont(ofSize: 17, weight: .regular)
}

struct ImageAsset {
    static let banner = "Banner-NShapeSets"
    static let buttonRest = "Button-Rest"
    static let buttonSkip = "Button-Skip"
    static let buttonStart = "Button-Start"
    static let inputBox = "InputBox-Rectangle"
    static let logo = "NShapeSets-Logo"
    static let currentSet = "Title-CurrentSet"
    static let nextSet = "Title-NextSet"
    static let remainingSets = "Title-RemainingSets"
    static let rest = "Title-Rest"
    static let restTime = "Title-RestTime"
    static let sets = "Title-Sets"
}

struct Defaults {
    static let workoutRest = "workout_rest"
    static let workoutRounds = "workout_rounds"
}

struct App {
    static var version: String {
        let appVersion = Bundle.main.infoDictionary!["CFBundleShortVersionString"] as? String
        let build = Bundle.main.infoDictionary?["CFBundleVersion"] as? String
        let buildString = "\(appVersion ?? "").\(build ?? "")"
        return buildString
    }
}
