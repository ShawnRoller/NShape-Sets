//
//  ActiveWorkoutView.swift
//  TVNShapeSets
//
//  Created by Shawn Roller on 2/8/21.
//  Copyright © 2021 offensively-bad. All rights reserved.
//

import SwiftUI

struct ActiveWorkoutView: View {
    @ObservedObject var timer: TimerWrapper
    
    var body: some View {
        VStack {
            Text("Hello, world!")
                .padding()
            Text("Remaining rest: \(timer.remainingRest)")
            Button("Start") {
                timer.start()
            }
        }
    }
}

struct ActiveWorkoutView_Previews: PreviewProvider {
    static var previews: some View {
        ActiveWorkoutView(timer: TimerWrapper.example)
    }
}
