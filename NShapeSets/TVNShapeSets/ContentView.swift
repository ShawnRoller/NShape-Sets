//
//  ContentView.swift
//  TVNShapeSets
//
//  Created by Shawn Roller on 1/23/21.
//  Copyright © 2021 offensively-bad. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var timer: TimerWrapper
    
    var body: some View {
        ZStack {
            BackgroundView()
            VStack {
                Text("Hello, world!")
                    .padding()
                Text("Remaining rest: \(timer.remainingRest)")
                Button("Start") {
                    timer.start()
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(timer: TimerWrapper.example)
    }
}
