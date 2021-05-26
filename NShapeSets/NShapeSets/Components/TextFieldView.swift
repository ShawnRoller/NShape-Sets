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
    @State var placeholder: String = ""
    
    var accentColor: Color = Palette.accentColor1
    
    var body: some View {
        TextField(title, text: $text, onEditingChanged: { (editingChanged) in
            if !editingChanged {
                if (self.text == "0" || self.text == "") {
                    self.text = self.placeholder
                }
            } else {
                self.placeholder = self.text
                self.text = ""
            }
        })
            .overlay(
                RoundedRectangle(cornerRadius: 2)
                    .stroke(accentColor, lineWidth: 1)
            )
            .accentColor(Palette.accentColor1)
            .foregroundColor(.white)
            .background(Color.white.opacity(0.2))
            .multilineTextAlignment(.center)
            .keyboardType(.numberPad)
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
