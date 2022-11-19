//
//  ContentView.swift
//  NShapeSets
//
//  Created by Shawn Roller on 11/30/19.
//  Copyright © 2019 offensively-bad. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var screenState: ScreenStateManager
    var healthManager: HealthManager?
    
    var body: some View {
        NavigationView {
            ZStack {
                BackgroundView()
                    .onTapGesture {
                        UIApplication.shared.endEditing()
                    }
                SetupView(healthManager: self.healthManager, screenState: screenState)
            }
            .navigationBarHidden(true)
        }
        .navigationViewStyle(StackNavigationViewStyle())
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ContentView(screenState: ScreenStateManager())
                .environment(\.colorScheme, .light)
            
            ContentView(screenState: ScreenStateManager())
                .environment(\.colorScheme, .dark)
        }
    }
}
