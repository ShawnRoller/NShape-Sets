//
//  ContentView.swift
//  NShapeSets
//
//  Created by Shawn Roller on 11/30/19.
//  Copyright © 2019 offensively-bad. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    var step: State
    
    var body: some View {
        ZStack {
            BackgroundView()
            SetupView()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var state = State.setup
    
    static var previews: some View {
        Group {
            ContentView(step: state)
                .environment(\.colorScheme, .light)
            
            ContentView(step: state)
                .environment(\.colorScheme, .dark)
        }
    }
}
