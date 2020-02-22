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
    
    var body: some View {
        VStack {
            InfoView(imageString: ImageAsset.currentSet, text: "\(timer.currentRound)")
            Spacer()
            InfoView(imageString: ImageAsset.remainingSets, text: "\(timer.rounds - timer.currentRound)")
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
        ActiveView(workout: Workout.example, timer: Timer.example, onButtonTap: {})
    }
}
