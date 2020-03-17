//
//  TextFieldView.swift
//  NShapeSets
//
//  Created by Shawn on 2/16/20.
//  Copyright © 2020 offensively-bad. All rights reserved.
//

import SwiftUI

struct TextFieldView: View {
    var title: String
    @Binding var text: String
    
    var accentColor: Color = Palette.accentColor2
    
    var body: some View {
        Text(text)
            .padding()
            .overlay(
                RoundedRectangle(cornerRadius: 2)
                    .stroke(accentColor, lineWidth: 1)
            )
            .multilineTextAlignment(.center)
            .watchInputFont()
    }
}

struct TextFieldView_Previews: PreviewProvider {
    static var previews: some View {
        TextFieldView(title: "Sets", text: .constant("15"))
    }
}
