//
//  SelectorView.swift
//  NShapeSets
//
//  Created by Shawn on 1/20/20.
//  Copyright © 2020 offensively-bad. All rights reserved.
//

import SwiftUI

struct SelectorView: View, SelectorProtocol {
    @Binding var value: Double
    var title: String
    
    var range: ClosedRange<Double> = 1...100
    var step: Double = 1
    var image: String?
    
    var body: some View {
        HStack(alignment: .top) {
            CustomSlider(range: range, step: step, value: $value)
                .padding(.top, 8)
            VStack {
                TextFieldView(title: title, text: $value.stringValue)
                if image != nil {
                    Image(image!)
                }
            }
            .frame(minWidth: 50, maxWidth: 100, minHeight: 50, maxHeight: 80)
        }
        .padding()
    }
}

struct SelectorView_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            BackgroundView()
            SelectorView(
                value: .constant(15.0),
                title: "Sets",
                image: "Title-Sets"
            )
        }
    }
}
