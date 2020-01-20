//
//  SelectorView.swift
//  NShapeSets
//
//  Created by Shawn on 1/20/20.
//  Copyright © 2020 offensively-bad. All rights reserved.
//

import SwiftUI

struct SelectorView: View {
    @Binding var value: Double
    @Binding var title: String
    
    var range: ClosedRange<Double> = 1...100
    var step: Double = 1
    
    var body: some View {
        HStack {
            CustomSlider(range: range, step: step, value: $value)
            // TODO: make the textfield accept a number
            TextFieldView(text: .constant("15"))
        }
    }
}

struct SelectorView_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            BackgroundView()
            SelectorView(
                value: .constant(15.0),
                title: .constant("Sets")
            )
        }
    }
}
