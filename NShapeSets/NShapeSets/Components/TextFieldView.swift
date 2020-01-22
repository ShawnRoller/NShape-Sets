//
//  TextFieldView.swift
//  NShapeSets
//
//  Created by Shawn on 1/20/20.
//  Copyright © 2020 offensively-bad. All rights reserved.
//

import SwiftUI

struct TextFieldView: View {
    var title: String
    @Binding var text: String
    
    var accentColor: Color = Palette.accentColor1
    
    var body: some View {
        TextField(title, text: $text)
            .overlay(
                RoundedRectangle(cornerRadius: 2)
                    .stroke(accentColor, lineWidth: 1)
            )
            .accentColor(Palette.accentColor1)
            .foregroundColor(.white)
            .background(Color.white.opacity(0.2))
            .multilineTextAlignment(.center)
            .inputFont()
    }
}

struct TextFieldView_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            BackgroundView()
            TextFieldView(title: "Sets", text: .constant("15"))
        }
    }
}
