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
    @Binding var isFocused: Bool
    
    var accentColor: Color {
        return self.isFocused ? Palette.accentColor1 : Palette.inactiveColor
    }
    
    var body: some View {
        Text(text)
            .frame(minWidth: 0, maxWidth: .infinity, minHeight: 25, maxHeight: 40)
            .padding(1)
            .overlay(
                RoundedRectangle(cornerRadius: 2)
                    .stroke(accentColor, lineWidth: 1)
            )
            .multilineTextAlignment(.center)
            .watchInputFont()
            .lineLimit(1)
    }
}

struct TextFieldView_Previews: PreviewProvider {
    static var previews: some View {
        TextFieldView(title: "Sets", text: .constant("15"), isFocused: .constant(true))
    }
}
