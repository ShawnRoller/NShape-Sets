//
//  SetupView.swift
//  NShapeSets
//
//  Created by Shawn on 2/17/20.
//  Copyright © 2020 offensively-bad. All rights reserved.
//

import SwiftUI

struct SetupView: View {
    @State private var sets = 1.0
    @State private var rest = 3.0
    
    var hkHelper: HealthKitHelper
    
    var body: some View {
        VStack {
            Spacer().frame(height: 0)
            SelectorView(value: $sets, title: "Sets")
            SelectorView(value: $rest, title: "Rest", incrementorValue: 5)
            Spacer()
            NavigationButton(title: "Start", destination: getWorkoutView())
            Spacer().frame(height: 0)
        }
    }
    
    func getWorkoutView() -> ActiveWorkoutView {
        let workout = self.getWorkoutWith(sets: self.sets, rest: self.rest)
        var workoutView = ActiveWorkoutView(workout: workout, hkHelper: self.hkHelper)
        
        // Setup timer
        let timer = TimerWrapper(rest: Int(self.rest), rounds: Int(self.sets), currentRound: 1, {
            workoutView.onRestEnd()
        }) {
            workoutView.countdown()
        }
        workoutView.timer = timer
        
        return workoutView
    }
    
    func getWorkoutWith(sets: Double, rest: Double) -> Workout {
        let workout = Workout(sets: sets, rest: rest, currentSet: 1)
        return workout
    }
}

struct SetupView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            SetupView(hkHelper: HealthKitHelper())
                .previewDevice(PreviewDevice(rawValue: "Apple Watch Series 3 - 42mm"))
            SetupView(hkHelper: HealthKitHelper())
                .previewDevice(PreviewDevice(rawValue: "Apple Watch Series 3 - 38mm"))
        }
    }
}
