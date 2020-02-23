//
//  ActiveView.swift
//  NShapeSets
//
//  Created by Shawn Roller on 2/23/20.
//  Copyright © 2020 offensively-bad. All rights reserved.
//

import SwiftUI

struct ActiveView: View {
    var workout: Workout
    @ObservedObject var timer: TimerWrapper
    var onButtonTap: () -> Void
    
    var body: some View {
        VStack {
            InstructionView(title: "Remaining sets:", value: "\(timer.currentRound)")
            Spacer()
            DetailView(title: "Next set:", value: "\(timer.rounds - timer.currentRound)")
            Spacer()
//            PrimaryButtonView(title: "REST") {
//                self.onButtonTap()
//            }
        }
    }
}

struct ActiveView_Previews: PreviewProvider {
    static var previews: some View {
        ActiveView(workout: Workout.example, timer: TimerWrapper.example, onButtonTap: {})
    }
}
