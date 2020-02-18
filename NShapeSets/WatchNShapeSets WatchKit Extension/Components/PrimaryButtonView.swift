//
//  PrimaryButtonView.swift
//  NShapeSets
//
//  Created by Shawn on 2/17/20.
//  Copyright © 2020 offensively-bad. All rights reserved.
//

import SwiftUI

struct PrimaryButtonView: View {
    var title: String
    var onButtonTap: () -> Void
    
    var body: some View {
        Button(action: {
            self.onButtonTap()
        }, label: {
            Text(self.title)
            .watchTitle1Font()
        })
            .accentColor(Palette.accentColor1)
    }
}

struct PrimaryButtonView_Previews: PreviewProvider {
    static var previews: some View {
        PrimaryButtonView(title: "Start", onButtonTap:{})
    }
}
