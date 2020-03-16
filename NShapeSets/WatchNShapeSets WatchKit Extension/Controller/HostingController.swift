//
//  HostingController.swift
//  WatchNShapeSets WatchKit Extension
//
//  Created by Shawn Roller on 12/4/19.
//  Copyright © 2019 offensively-bad. All rights reserved.
//

import WatchKit
import Foundation
import SwiftUI

class HostingController: WKHostingController<ContentView> {
    private var hkHelper = HealthKitHelper()
    
    override var body: ContentView {
        self.hkHelper.setupHK()
        
        return ContentView(hkHelper: self.hkHelper)
    }
}
