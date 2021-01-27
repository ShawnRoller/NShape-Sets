//
//  CircleTimerView.swift
//  NShapeSets
//
//  Created by Shawn Roller on 1/26/21.
//  Copyright © 2021 offensively-bad. All rights reserved.
//

import SwiftUI

struct ArcShape: Shape {
    var currentTime: CGFloat
    let roundTime: Int
    private var degreesPerSecond: Double {
        360.0 / Double(roundTime)
    }
    private let startAngle: Angle = Angle(degrees: 0)
    private var endAngle: Angle {
        Angle(degrees: degreesPerSecond * Double(currentTime))
    }

    func path(in rect: CGRect) -> Path {
        let diameter = min(rect.size.width, rect.size.height) - 24.0
        let radius = diameter / 2.0
        let center = CGPoint(x: rect.origin.x + rect.size.width / 2.0, y: rect.origin.y + rect.size.height / 2.0)
        return Path { path in
            path.addArc(center: center, radius: radius, startAngle: startAngle, endAngle: endAngle, clockwise: false)
        }
    }
    
    var animatableData: CGFloat {
        get { currentTime }
        set { self.currentTime = newValue }
    }
}

struct CircleTimerView: View {
    var roundTime: Int
    var currentTime: Int
    @State private var remainingTime: CGFloat = 50
    
    var body: some View {
        ZStack {
            Circle()
                .strokeBorder(lineWidth: 24, antialiased: true)
            ArcShape(currentTime: CGFloat(remainingTime), roundTime: 50)
                .rotation(Angle(degrees: -90))
                .stroke(Color.red, lineWidth: 12)
                .onTapGesture {
                    withAnimation {
                        self.remainingTime = self.remainingTime - 1
                    }
                }
        }
        .padding(.horizontal)
    }
}

struct CircleTimerView_Previews: PreviewProvider {
    static var previews: some View {
        CircleTimerView(roundTime: 50, currentTime: 15)
    }
}
