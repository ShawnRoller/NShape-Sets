//
//  ContentView.swift
//  NShapeSets
//
//  Created by Shawn Roller on 11/30/19.
//  Copyright © 2019 offensively-bad. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    var step: ScreenState
    var healthManager: HealthManager?
    
    var body: some View {
        NavigationView {
            ZStack {
                BackgroundView()
                    .onTapGesture {
                        UIApplication.shared.endEditing()
                    }
                SetupView(healthManager: self.healthManager)
            }
            .navigationBarHidden(true)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var state = ScreenState.setup
    
    static var previews: some View {
        Group {
            ContentView(step: state)
                .environment(\.colorScheme, .light)
            
            ContentView(step: state)
                .environment(\.colorScheme, .dark)
        }
    }
}
