//
//  StateModels.swift
//  NShapeSets
//
//  Created by Shawn Roller on 12/16/19.
//  Copyright © 2019 offensively-bad. All rights reserved.
//

import Foundation

enum ScreenState: String {
    case setup = "setup"
    case active = "active"
    case rest = "rest"
    case complete = "complete"
}

enum ActiveAlert {
    case done, back
}
