//
//  SetupView.swift
//  NShapeSets
//
//  Created by Shawn Roller on 12/2/19.
//  Copyright © 2019 offensively-bad. All rights reserved.
//

import SwiftUI

struct SetupView: View {
    
    @State private var sets = 15.0
    @State private var rest = 25.0
    
    var body: some View {
        VStack {
            BannerView()
            Spacer()
            SelectorView(value: $sets, title: "Sets", range: 0.0...100.0, step: 1.0, image: "Title-Sets")
            Spacer()
            SelectorView(value: $rest, title: "Rest", range: 0.0...100.0, step: 1.0, image: "Title-Rest")
            Spacer()
            Image("Button-Start")
            Spacer()
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
