//
//  ActiveWorkoutView.swift
//  NShapeSets
//
//  Created by Shawn Roller on 2/22/20.
//  Copyright © 2020 offensively-bad. All rights reserved.
//

import SwiftUI

struct ActiveWorkoutView: View {
    @State private var buttonTitle = "Rest"
    @State private var workoutState: ScreenState = .active
    @State private var showingAlert = false
    @ObservedObject var timer: TimerWrapper
    var workout: Workout
    
    var body: some View {
        VStack {
            getViewForState(workoutState)
            Spacer()
            PrimaryButtonView(title: buttonTitle) {
                
            }
        }
        .alert(isPresented: $showingAlert) {
            Alert(title: Text("Workout complete!"), message: Text("You completed all sets!"), dismissButton: .default(Text("OK"), action: {
                // TODO: go back
            }))
        }
    }
    
    func getViewForState(_ state: ScreenState) -> some View {
        return Group {
            if timer.isActive {
                // TODO: return the rest view
//                RestView(workout: workout, timer: timer) {
//                    self.onSkip()
//                }
            }
            else {
                // TODO: return the active view
            }
        }
    }
}

struct ActiveWorkoutView_Previews: PreviewProvider {
    static var previews: some View {
        ActiveWorkoutView(timer: Timer.example, workout: Workout.example)
    }
}
