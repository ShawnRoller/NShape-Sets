//
//  InstructionView.swift
//  NShapeSets
//
//  Created by Shawn Roller on 2/23/20.
//  Copyright © 2020 offensively-bad. All rights reserved.
//

import SwiftUI

struct InstructionView: View {
    var title: String
    var value: String
    var countdownTotal: Int?
    var currentCountdown: Int?
    
    var body: some View {
        VStack {
            Text(title)
                .foregroundColor(Palette.accentColor1)
                .watchInstructionTitleFont()
            ZStack {
                if let countdownTotal = countdownTotal, let currentCountdown = currentCountdown {
                    CircleTimerView(roundTime: countdownTotal, currentTime: currentCountdown, backgroundColor: Palette.accentColor2, foregroundColor: Palette.accentColor1, circleWidth: 6, progressLineWidth: 4)
                }
            Text(value)
                .foregroundColor(Palette.inputColor)
                .watchInstructionFont()
            }
        }
    }
}

struct InstructionView_Previews: PreviewProvider {
    static var previews: some View {
        InstructionView(title: "Current set", value: "99")
    }
}
