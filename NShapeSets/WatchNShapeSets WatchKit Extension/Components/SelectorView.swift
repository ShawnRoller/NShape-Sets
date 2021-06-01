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
    
    @State var isFocused = false
    var range: ClosedRange<Double> = 1...100
    
    let MIN_VALUE = 0.0
    let MAX_VALUE = 500.0
    
    var body: some View {
        VStack(spacing: 1) {
            Text(title)
                .watchTitleFont()
                .foregroundColor(Palette.accentColor1)
                .lineLimit(1)
            HStack(spacing: 3){
                Spacer()
                SelectorButton(value: $value, iconName: "minus.circle.fill") {
                    self.onDecrement()
                }
                TextFieldView(title: title, text: $value.stringValue, isFocused: $isFocused)
                    .focusable(true, onFocusChange: { (focused) in
                        self.isFocused = focused
                    })
                    .digitalCrownRotation($value, from: MIN_VALUE, through: MAX_VALUE, by: self.incrementorValue, sensitivity: .medium, isHapticFeedbackEnabled: true)
                SelectorButton(value: $value, iconName: "plus.circle.fill") {
                    self.onIncrement()
                }
                Spacer()
            }
        }
    }
    
    func onDecrement() {
        let newValue = value - incrementorValue
        value = max(newValue, MIN_VALUE)
    }
    
    func onIncrement() {
        let newValue = value + incrementorValue
        value = min(newValue, MAX_VALUE)
    }
    
}

struct SelectorView_Previews: PreviewProvider {
    static var previews: some View {
        SelectorView(value: .constant(15.0), title: "Sets")
    }
}
