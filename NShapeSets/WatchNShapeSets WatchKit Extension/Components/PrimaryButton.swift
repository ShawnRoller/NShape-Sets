//
//  PrimaryButton.swift
//  NShapeSets
//
//  Created by Shawn Roller on 2/24/20.
//  Copyright © 2020 offensively-bad. All rights reserved.
//

import SwiftUI

struct PrimaryButton: View {
    var title: String
    var buttonColor: Color = Palette.button2Color
    var onButtonTap: () -> Void
    
    var body: some View {
        Button(action: {
            self.onButtonTap()
        }, label: {
            Text(title)
                .watchInputFont()
        })
            .background(buttonColor)
            .cornerRadius(100)
    }
}

struct PrimaryButton_Previews: PreviewProvider {
    static var previews: some View {
        PrimaryButton(title: "REST", buttonColor: Palette.button1Color, onButtonTap: {})
    }
}
