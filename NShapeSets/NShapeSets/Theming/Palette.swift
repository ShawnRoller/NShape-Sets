//
//  Palette.swift
//  NShapeSets
//
//  Created by Shawn Roller on 12/7/19.
//  Copyright © 2019 offensively-bad. All rights reserved.
//

import Foundation
import SwiftUI

struct Palette {
    
    static let backgroundGradientColors = [Color("TopGradient"), Color("BottomGradient")]
    static let backgroundGradient = Gradient(colors: Palette.backgroundGradientColors)
    static let button1Color = Color("Button1Color", bundle: Bundle(identifier: Constants.appGroup))
    static let button2Color = Color("Button2Color")
    static let header1Color = Color("Header1TypeColor")
    static let header2Color = Color("Header2TypeColor")
    static let inputColor = Color("InputColor")
    static let accentColor1 = Color("AccentColor1")
    static let accentColor2 = Color("AccentColor2")
    static let buttonTitleColor = Color.white
    static let inactiveColor = Color.gray
    
}
