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
            PrimaryButtonView(title: "Start", destination: ActiveWorkoutView(timer: TimerWrapper.example, workout: Workout.example))
            Spacer()
                .frame(height:0)
        }
    }
}

struct SetupView_Previews: PreviewProvider {
    static var previews: some View {
        SetupView()
    }
}
