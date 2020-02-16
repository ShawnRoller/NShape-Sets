//
//  SelectorView.swift
//  NShapeSets
//
//  Created by Shawn on 2/16/20.
//  Copyright © 2020 offensively-bad. All rights reserved.
//

import SwiftUI

struct SelectorView: View {
    @Binding var value: Double
    var title: String
    
    var range: ClosedRange<Double> = 1...100
    
    var body: some View {
        HStack(spacing: 3) {
            Text(title)
                .watchTitle1Font()
                .padding([.trailing], 0)
            ButtonView(value: $value, iconName: "minus.square.fill") {
                self.onDecrement()
            }
            TextFieldView(title: title, text: $value.stringValue)
            ButtonView(value: $value, iconName: "plus.square.fill") {
                self.onIncrement()
            }
        }
    }
    
    func onDecrement() {
        value -= 1
    }
    
    func onIncrement() {
        value += 1
    }
    
}

struct SelectorView_Previews: PreviewProvider {
    static var previews: some View {
        SelectorView(value: .constant(15.0), title: "Sets")
    }
}
