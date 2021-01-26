//
//  CircleTimerView.swift
//  NShapeSets
//
//  Created by Shawn Roller on 1/26/21.
//  Copyright © 2021 offensively-bad. All rights reserved.
//

import SwiftUI

struct arcshape: Shape {
    let currentTime: Int
    let roundTime: Int
    private var degreesPerSecond: Double {
        360.0 / Double(roundTime)
    }
    private var startAngle: Angle {
        Angle(degrees: degreesPerSecond * Double(currentTime))
    }
    private var endAngle: Angle {
        Angle(degrees: startAngle.degrees + degreesPerSecond)
    }

    func path(in rect: CGRect) -> Path {
        let diameter = min(rect.size.width, rect.size.height) - 24.0
        let radius = diameter / 2.0
        let center = CGPoint(x: rect.origin.x + rect.size.width / 2.0, y: rect.origin.y + rect.size.height / 2.0)
        return Path { path in
            path.addArc(center: center, radius: radius, startAngle: startAngle, endAngle: endAngle, clockwise: false)
        }
    }
}

struct CircleTimerView: View {
    var roundTime: Int = 60
    var currentTime: Int = 2
    
    var body: some View {
        ZStack {
            Circle()
                .strokeBorder(lineWidth: 24, antialiased: true)
                    arcshape(currentTime: roundTime, roundTime: currentTime)
                        .rotation(Angle(degrees: -90))
                        .stroke(Color.red, lineWidth: 12)
        }
        .padding(.horizontal)
    }
}

struct CircleTimerView_Previews: PreviewProvider {
    static var previews: some View {
        CircleTimerView()
    }
}
