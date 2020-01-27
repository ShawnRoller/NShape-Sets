//
//  ActiveView.swift
//  NShapeSets
//
//  Created by Shawn Roller on 1/27/20.
//  Copyright © 2020 offensively-bad. All rights reserved.
//

import SwiftUI

struct ActiveView: View, ActiveWorkoutContent {
    var workout: Workout
    var onButtonTap: () -> Void
    
    var body: some View {
        VStack {
            InfoView(imageString: ImageAsset.currentSet, text: "10")
            Spacer()
            InfoView(imageString: ImageAsset.remainingSets, text: "10")
            Spacer()
            Image(ImageAsset.buttonRest)
                .onTapGesture {
                    self.onButtonTap()
                }
        }
    }
}

struct ActiveView_Previews: PreviewProvider {
    static var previews: some View {
        ActiveView(workout: Workout.example, onButtonTap: {})
    }
}
