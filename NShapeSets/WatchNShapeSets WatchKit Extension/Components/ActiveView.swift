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
    
    var buttonTitle: String {
        let remainingRounds = timer.rounds - timer.currentRound
        return remainingRounds > 0 ? "Rest" : "Done"
    }
    
    var body: some View {
        VStack {
            DetailView(title: "Total time:", value: "\(TimeHelper.getTimeFromSeconds(timer.remainingRounds))", smallText: true)
            InstructionView(title: "Current set:", value: "\(timer.currentRound)")
            Spacer().frame(height:0)
            DetailView(title: "Remaining:", value: "\(timer.remainingRounds)", smallText: true)
            Spacer()
            PrimaryButton(title: buttonTitle, buttonColor: Palette.button2Color) {
                self.onButtonTap()
            }
        }
    }
}

struct ActiveView_Previews: PreviewProvider {
    static var previews: some View {
        ActiveView(workout: Workout.example, timer: TimerWrapper.example, onButtonTap: {})
    }
}
