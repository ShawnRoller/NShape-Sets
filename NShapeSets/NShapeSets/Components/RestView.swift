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
    var onButtonTap: () -> Void
    
    var body: some View {
        VStack {
            InfoView(imageString: ImageAsset.restTime, text: "10")
            Spacer()
            InfoView(imageString: ImageAsset.nextSet, text: "10")
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
        RestView(workout: Workout.example, onButtonTap: {})
    }
}
