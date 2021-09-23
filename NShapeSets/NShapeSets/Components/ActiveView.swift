//
//  ActiveView.swift
//  NShapeSets
//
//  Created by Shawn Roller on 1/27/20.
//  Copyright © 2020 offensively-bad. All rights reserved.
//

import SwiftUI

struct ActiveView: View, ActiveWorkoutContent {
    var workout: Workout
    @ObservedObject var timer: TimerWrapper
    var onButtonTap: () -> Void
    var remainingSets: String {
        return "\(timer.remainingRounds)"
    }
    
    var body: some View {
        VStack {
            InfoView(imageString: ImageAsset.currentSet, text: "\(timer.currentRound)")
            Spacer()
            InfoView(imageString: ImageAsset.remainingSets, text: remainingSets)
            Spacer()
            Image(ImageAsset.buttonRest)
                .onTapGesture {
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
