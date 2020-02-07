//
//  SetupView.swift
//  NShapeSets
//
//  Created by Shawn Roller on 12/2/19.
//  Copyright © 2019 offensively-bad. All rights reserved.
//

import SwiftUI

struct SetupView: View {
    
    @State private var sets = 8.0
    @State private var rest = 5.0
    @State private var isWorkoutActive = false
    
    var body: some View {
        VStack {
            BannerView()
            Spacer()
            SelectorView(value: $sets, title: "Sets", range: 1.0...100.0, step: 1.0, image: ImageAsset.sets)
            Spacer()
            SelectorView(value: $rest, title: "Rest", range: 1.0...100.0, step: 1.0, image: ImageAsset.rest)
            Spacer()
            Image(ImageAsset.buttonStart)
                .onTapGesture {
                    self.isWorkoutActive.toggle()
                }
            Spacer()
        }
        .sheet(isPresented: $isWorkoutActive) {
            self.getWorkoutView()
        }
    }
    
    func getWorkoutView() -> some View {
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
        Group {
            SetupView()
                .environment(\.colorScheme, .light)
            
            SetupView()
                .environment(\.colorScheme, .dark)
        }
    }
}
