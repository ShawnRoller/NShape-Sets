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
    @ObservedObject var timer: TimerWrapper
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
            if timer.isActive {
                RestView(workout: workout, timer: timer) {
                    self.onSkip()
                }
            }
            else {
                ActiveView(workout: workout, timer: timer) {
                    self.onRest()
                }
            }
        }
    }
    
    func onRest() {
        workoutState = workoutState == .active ? .rest : .active
        timer.start()
    }
    
    func onSkip() {
        workoutState = workoutState == .active ? .rest : .active
        timer.restComplete()
    }
}

struct ActiveWorkoutView_Previews: PreviewProvider {
    static let timer = TimerWrapper(rest: 3, rounds: 4, currentRound: 1)
    
    static var previews: some View {
        ActiveWorkoutView(timer: timer, workout: Workout.example)
    }
}
