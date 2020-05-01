//
//  RestView.swift
//  NShapeSets
//
//  Created by Shawn Roller on 1/27/20.
//  Copyright © 2020 offensively-bad. All rights reserved.
//

import SwiftUI

struct RestView: View, ActiveWorkoutContent {
    var workout: Workout
    @ObservedObject var timer: TimerWrapper
    var onButtonTap: () -> Void
    
    var body: some View {
        VStack {
            InfoView(imageString: ImageAsset.restTime, text: "\(timer.remainingRest)")
            Spacer()
            InfoView(imageString: ImageAsset.nextSet, text: "\(timer.nextSetString) of \(timer.remainingRounds)")
            Spacer()
            Image(ImageAsset.buttonSkip)
                .onTapGesture {
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
