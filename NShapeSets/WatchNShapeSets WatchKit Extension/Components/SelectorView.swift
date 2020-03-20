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
    var incrementorValue: Double = 1
    
    var range: ClosedRange<Double> = 1...100
    
    var body: some View {
        HStack(spacing: 5) {
            Text(title)
                .watchTitleFont()
                .foregroundColor(Palette.accentColor1)
                .lineLimit(1)
            HStack(spacing: 0){
                SelectorButton(value: $value, iconName: "minus.square.fill") {
                    self.onDecrement()
                }
                TextFieldView(title: title, text: $value.stringValue)
                    .frame(minWidth: 35, maxWidth: 50, minHeight: 25, maxHeight: 40)
                SelectorButton(value: $value, iconName: "plus.square.fill") {
                    self.onIncrement()
                }
            }
        }
    }
    
    func onDecrement() {
        let newValue = value - incrementorValue
        value = max(newValue, 0)
    }
    
    func onIncrement() {
        let newValue = value + incrementorValue
        value = min(newValue, 500)
    }
    
}

struct SelectorView_Previews: PreviewProvider {
    static var previews: some View {
        SelectorView(value: .constant(15.0), title: "Sets")
    }
}
