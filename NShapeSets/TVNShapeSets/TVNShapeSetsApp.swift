//
//  TVNShapeSetsApp.swift
//  TVNShapeSets
//
//  Created by Shawn Roller on 1/23/21.
//  Copyright © 2021 offensively-bad. All rights reserved.
//

import SwiftUI

@main
struct TVNShapeSetsApp: App {
    let timer = TimerWrapper(rest: 30, rounds: 2, currentRound: 1, authorizedNotifications: false, {
        
    }) {
        
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView(timer: timer)
        }
    }
}
