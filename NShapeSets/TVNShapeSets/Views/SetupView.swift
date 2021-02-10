//
//  SetupView.swift
//  TVNShapeSets
//
//  Created by Shawn Roller on 2/8/21.
//  Copyright © 2021 offensively-bad. All rights reserved.
//

import SwiftUI

struct SetupView: View {
    let timer = TimerWrapper(rest: 30, rounds: 2, currentRound: 1, authorizedNotifications: false, {
        
    }) {
        
    }
    
    var body: some View {
        ActiveWorkoutView(timer: timer)
    }
}

struct SetupView_Previews: PreviewProvider {
    static var previews: some View {
        SetupView()
    }
}
