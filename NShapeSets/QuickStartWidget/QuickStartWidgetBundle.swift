//
//  QuickStartWidgetBundle.swift
//  QuickStartWidget
//
//  Created by Shawn Roller on 11/9/22.
//  Copyright © 2022 offensively-bad. All rights reserved.
//

import WidgetKit
import SwiftUI

@main
struct QuickStartWidgetBundle: WidgetBundle {
    var body: some Widget {
        QuickStartWidget()
        QuickStartWidgetLiveActivity()
    }
}
