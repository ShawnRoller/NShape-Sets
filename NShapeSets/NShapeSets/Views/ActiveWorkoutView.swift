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
    var workout: Workout
    
    var topImage: String {
        var imageString = ImageAsset.currentSet
        if workoutState == .rest {
            imageString = ImageAsset.restTime
        }
        return imageString
    }
    
    var middleImage: String {
        var imageString = ImageAsset.remainingSets
        if workoutState == .rest {
            imageString = ImageAsset.nextSet
        }
        return imageString
    }
    
    var bottomImage: Image {
        var imageString = ImageAsset.buttonRest
        if workoutState == .rest {
            imageString = ImageAsset.buttonSkip
        }
        return Image(imageString)
    }
    
    var body: some View {
        VStack {
            BannerView()
            Spacer()
            InfoView(imageString: topImage, text: "10")
            Spacer()
            InfoView(imageString: middleImage, text: "10")
            Spacer()
            bottomImage
                .onTapGesture {
                    // TODO: skip to next set or skip rest
                }
            Spacer()
        }
    }
}

struct ActiveWorkoutView_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            BackgroundView()
            ActiveWorkoutView(workout: Workout.example)
        }
    }
}
