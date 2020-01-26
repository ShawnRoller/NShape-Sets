//
//  SetupView.swift
//  NShapeSets
//
//  Created by Shawn Roller on 12/2/19.
//  Copyright © 2019 offensively-bad. All rights reserved.
//

import SwiftUI

struct SetupView: View {
    
    @State private var sets = 15.0
    @State private var rest = 25.0
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
            ActiveWorkoutView(workout: Workout.example)
        }
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
