//
//  ActiveWorkoutView.swift
//  NShapeSets
//
//  Created by Shawn Roller on 2/22/20.
//  Copyright © 2020 offensively-bad. All rights reserved.
//

import SwiftUI

struct ActiveWorkoutView: View {
    @Environment(\.presentationMode) var presentationMode
    @State private var workoutState: ScreenState = .active
    @State private var showingAlert = false
    @ObservedObject var timer: TimerWrapper
    var workout: Workout
    
    init(workout: Workout) {
        self.workout = workout
        self.timer = TimerWrapper.example
    }
    
    var body: some View {
        VStack {
            getViewForState(workoutState)
        }
        .alert(isPresented: $showingAlert) {
            Alert(title: Text("Workout complete!"), message: Text("You completed all sets!"), dismissButton: .default(Text("OK"), action: {
                self.goBack()
            }))
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
    
    func countdown() {
        if 1...3 ~= timer.remainingRest {
            HapticHelper.playCountdownHaptic()
        }
    }
    
    func onRestEnd() {
        print("rest is over")
        workoutState = workoutState == .active ? .rest : .active
        timer.restComplete()
    }
    
    func goBack() {
        presentationMode.wrappedValue.dismiss()
    }
    
    func onRest() {
        if timer.currentRound == timer.rounds {
            showingAlert = true
        }
        else {
            workoutState = workoutState == .active ? .rest : .active
            timer.start()
        }
    }
    
    func onSkip() {
        onRestEnd()
    }
}

struct ActiveWorkoutView_Previews: PreviewProvider {
    static var previews: some View {
        ActiveWorkoutView(workout: Workout.example)
    }
}
