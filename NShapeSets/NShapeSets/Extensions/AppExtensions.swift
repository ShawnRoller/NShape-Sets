//
//  AppExtensions.swift
//  NShapeSets
//
//  Created by Shawn Roller on 2/9/20.
//  Copyright © 2020 offensively-bad. All rights reserved.
//

import SwiftUI

extension UIApplication {
    func endEditing() {
        sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
