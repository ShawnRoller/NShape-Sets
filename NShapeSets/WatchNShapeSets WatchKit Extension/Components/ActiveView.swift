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
                .frame(height: 20)
            DetailView(title: "Next set:", value: "\(timer.rounds - timer.currentRound)")
            Spacer()
            PrimaryButton(title: "REST", buttonColor: Palette.button2Color) {
                self.onButtonTap()
            }
                .frame(height: 0)
        }
    }
}

struct ActiveView_Previews: PreviewProvider {
    static var previews: some View {
        ActiveView(workout: Workout.example, timer: TimerWrapper.example, onButtonTap: {})
    }
}
