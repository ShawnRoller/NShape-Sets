//
//  StateHelper.swift
//  NShapeSets
//
//  Created by Shawn Roller on 11/19/22.
//  Copyright © 2022 offensively-bad. All rights reserved.
//

import Foundation

class ScreenStateManager: ObservableObject {
    @Published var state: ScreenState = .setup
}
