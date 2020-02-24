//
//  RestView.swift
//  NShapeSets
//
//  Created by Shawn Roller on 2/23/20.
//  Copyright © 2020 offensively-bad. All rights reserved.
//

import SwiftUI

struct RestView: View {
    var workout: Workout
    @ObservedObject var timer: TimerWrapper
    var onButtonTap: () -> Void
    
    var body: some View {
        VStack {
            InstructionView(title: "Resting...", value: "\(timer.remainingRest)")
            Spacer()
            DetailView(title: "Next set:", value: "\(timer.currentRound + 1)")
            Spacer()
            PrimaryButton(title: "SKIP") {
                self.onButtonTap()
            }
        }
    }
}

struct RestView_Previews: PreviewProvider {
    static var previews: some View {
        RestView(workout: Workout.example, timer: TimerWrapper.example, onButtonTap: {})
    }
}
