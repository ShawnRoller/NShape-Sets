//
//  SetupView.swift
//  NShapeSets
//
//  Created by Shawn on 2/17/20.
//  Copyright © 2020 offensively-bad. All rights reserved.
//

import SwiftUI

struct SetupView: View {
    @State private var sets = 8.0
    @State private var rest = 5.0
    
    var body: some View {
        VStack {
            SelectorView(value: $sets, title: "Sets")
            SelectorView(value: $rest, title: "Rest")
            Spacer()
            NavigationButton(title: "Start", destination: getWorkoutView())
            Spacer()
                .frame(height:0)
        }
    }
    
    func getWorkoutView() -> ActiveWorkoutView {
        let workout = self.getWorkoutWith(sets: self.sets, rest: self.rest)
        let timer = TimerWrapper(rest: Int(self.rest), rounds: Int(self.sets), currentRound: 1)
        return ActiveWorkoutView(timer: timer, workout: workout)
    }
    
    func getWorkoutWith(sets: Double, rest: Double) -> Workout {
        let workout = Workout(sets: sets, rest: rest, currentSet: 1)
        return workout
    }
}

struct SetupView_Previews: PreviewProvider {
    static var previews: some View {
        SetupView()
    }
}
