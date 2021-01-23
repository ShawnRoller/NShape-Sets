//
//  ContentView.swift
//  TVNShapeSets
//
//  Created by Shawn Roller on 1/23/21.
//  Copyright © 2021 offensively-bad. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    let background = LinearGradient(gradient: Palette.backgroundGradient, startPoint: .top, endPoint: .bottom)
    
    var body: some View {
        Text("Hello, world!")
            .padding()
        Rectangle()
            .fill(background)
            .edgesIgnoringSafeArea(.all)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
