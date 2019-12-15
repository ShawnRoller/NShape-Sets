//
//  ContentView.swift
//  NShapeSets
//
//  Created by Shawn Roller on 11/30/19.
//  Copyright © 2019 offensively-bad. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    var body: some View {
        ZStack {
            BackgroundView()
            VStack {
                Text("Hello, World!")
                Text("Hello, World!")
                    .defaultFont()
                    .foregroundColor(Palette.inputColor)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ContentView()
                .environment(\.colorScheme, .light)
            
            ContentView()
            .environment(\.colorScheme, .dark)
        }
    }
}
