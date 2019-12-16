//
//  SetupView.swift
//  NShapeSets
//
//  Created by Shawn Roller on 12/2/19.
//  Copyright © 2019 offensively-bad. All rights reserved.
//

import SwiftUI

struct SetupView: View {
    
    var body: some View {
        VStack {
            Text("Hello, World!")
                .header1Font()
                .foregroundColor(Palette.header1Color)
        }
    }
}

struct SetupView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            SetupView()
                .environment(\.colorScheme, .light)
            
            SetupView()
                .environment(\.colorScheme, .dark)
        }
    }
}
