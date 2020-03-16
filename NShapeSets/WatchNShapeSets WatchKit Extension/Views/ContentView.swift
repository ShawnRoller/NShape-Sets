//
//  ContentView.swift
//  WatchNShapeSets WatchKit Extension
//
//  Created by Shawn Roller on 12/4/19.
//  Copyright © 2019 offensively-bad. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var hkHelper: HealthKitHelper
    
    var body: some View {
        SetupView(hkHelper: self.hkHelper)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(hkHelper: HealthKitHelper())
    }
}
