//
//  BackgroundView.swift
//  NShapeSets
//
//  Created by Shawn Roller on 12/7/19.
//  Copyright © 2019 offensively-bad. All rights reserved.
//

import SwiftUI

struct BackgroundView: View {
    
    var body: some View {
        
        let background = LinearGradient(gradient: Palette.backgroundGradient, startPoint: .top, endPoint: .bottom)
        
        return Rectangle()
            .fill(background)
            .edgesIgnoringSafeArea(.all)
    }
}

struct BackgroundView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            BackgroundView()
                .environment(\.colorScheme, .light)
            
            BackgroundView()
            .environment(\.colorScheme, .dark)
        }
    }
}
