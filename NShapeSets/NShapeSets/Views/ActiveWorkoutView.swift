//
//  ActiveWorkoutView.swift
//  NShapeSets
//
//  Created by Shawn Roller on 1/25/20.
//  Copyright © 2020 offensively-bad. All rights reserved.
//

import SwiftUI

struct ActiveWorkoutView: View {
    @State private var workoutState: ScreenState = .active
    var workout: Workout
    
    var body: some View {
        ZStack {
            BackgroundView()
            VStack {
                BannerView()
                Spacer()
                getViewForState(workoutState)
                Spacer()
            }
        }
    }
    
    func getViewForState(_ state: ScreenState) -> some View {
        return Group {
            if workoutState == .rest {
                RestView(workout: workout) {
                    self.onRest()
                }
            }
            else {
                ActiveView(workout: workout) {
                    self.onSkip()
                }
            }
        }
    }
    
    func onRest() {
        workoutState = workoutState == .active ? .rest : .active
    }
    
    func onSkip() {
        workoutState = workoutState == .active ? .rest : .active
    }
}

struct ActiveWorkoutView_Previews: PreviewProvider {
    static var previews: some View {
        ActiveWorkoutView(workout: Workout.example)
    }
}
