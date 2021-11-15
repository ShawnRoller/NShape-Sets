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
                    CircleTimerView(roundTime: countdownTotal, currentTime: currentCountdown, backgroundColor: Palette.accentColor2, foregroundColor: Palette.accentColor1, circleWidth: 8, progressLineWidth: 7)
                        .frame(width: 150, height: 150)
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
