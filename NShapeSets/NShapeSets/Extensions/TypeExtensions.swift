//
//  TypeExtensions.swift
//  NShapeSets
//
//  Created by Shawn on 1/22/20.
//  Copyright © 2020 offensively-bad. All rights reserved.
//

import SwiftUI

extension Double {
    var stringValue: String {
        get { "\(self)" }
        set { self = Double(newValue) ?? 0.0 }
    }
}
