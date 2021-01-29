//
//  InfoView.swift
//  NShapeSets
//
//  Created by Shawn Roller on 1/25/20.
//  Copyright © 2020 offensively-bad. All rights reserved.
//

import SwiftUI

struct InfoView: View {
    var imageString: String
    var text: String
    var countdownTotal: Int?
    var currentCountdown: Int?
    
    var body: some View {
        VStack {
            Image(imageString)
            ZStack {
                if let countdownTotal = countdownTotal, let currentCountdown = currentCountdown {
                    CircleTimerView(roundTime: countdownTotal, currentTime: currentCountdown, backgroundColor: Palette.accentColor2, foregroundColor: Palette.accentColor1, circleWidth: 14, progressLineWidth: 10)
                }
                Text(text)
                    .foregroundColor(.white)
                    .header2Font()
            }
        }
    }
}

struct InfoView_Previews: PreviewProvider {
    static var previews: some View {
        InfoView(imageString: ImageAsset.currentSet, text: "10")
    }
}
