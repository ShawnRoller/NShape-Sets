//
//  InstructionView.swift
//  NShapeSets
//
//  Created by Shawn Roller on 2/23/20.
//  Copyright © 2020 offensively-bad. All rights reserved.
//

import SwiftUI

struct InstructionView: View {
    var title: String
    var value: String
    
    var body: some View {
        VStack {
            Text(title)
                .foregroundColor(Palette.accentColor1)
                .watchInstructionTitleFont()
            Text(value)
                .foregroundColor(Palette.inputColor)
                .watchInstructionFont()
        }
    }
}

struct InstructionView_Previews: PreviewProvider {
    static var previews: some View {
        InstructionView(title: "Current set", value: "99")
    }
}
