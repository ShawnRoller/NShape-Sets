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
    let strokeWidth: CGFloat
    
    private var degreesPerSecond: Double {
        360.0 / Double(roundTime)
    }
    private let startAngle: Angle = Angle(degrees: 0)
    private var endAngle: Angle {
        Angle(degrees: degreesPerSecond * Double(currentTime))
    }

    func path(in rect: CGRect) -> Path {
        let diameter = min(rect.size.width, rect.size.height) - strokeWidth
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
    var backgroundColor: Color = Color.black
    var foregroundColor: Color = Color.red
    var circleWidth: CGFloat = 24.0
    var progressLineWidth: CGFloat = 12.0
    @State private var remainingTime: CGFloat = 0
    
    var body: some View {
        ZStack {
            Circle()
                .strokeBorder(lineWidth: circleWidth, antialiased: true)
                .foregroundColor(backgroundColor)
            ArcShape(currentTime: CGFloat(remainingTime), roundTime: roundTime, strokeWidth: circleWidth)
                .rotation(Angle(degrees: -90))
                .stroke(foregroundColor, lineWidth: progressLineWidth)
                .onChange(of: currentTime, perform: { value in
                    withAnimation {
                        self.remainingTime = CGFloat(self.currentTime) - 1
                    }
                })
        }
        .padding(.horizontal)
        .onAppear {
            remainingTime = CGFloat(currentTime)
        }
    }
}

struct CircleTimerView_Previews: PreviewProvider {
    static var previews: some View {
        CircleTimerView(roundTime: 50, currentTime: 15)
    }
}
