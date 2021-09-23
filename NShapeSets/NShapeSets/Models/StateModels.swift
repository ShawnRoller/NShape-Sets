//
//  StateModels.swift
//  NShapeSets
//
//  Created by Shawn Roller on 12/16/19.
//  Copyright © 2019 offensively-bad. All rights reserved.
//

import Foundation

enum ScreenState {
    case setup
    case active
    case rest
    case complete
}

enum ActiveAlert {
    case done, back
}
