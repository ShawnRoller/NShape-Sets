//
//  ContentView.swift
//  TVNShapeSets
//
//  Created by Shawn Roller on 1/23/21.
//  Copyright © 2021 offensively-bad. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    var body: some View {
        ZStack {
            BackgroundView()
            SetupView()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
