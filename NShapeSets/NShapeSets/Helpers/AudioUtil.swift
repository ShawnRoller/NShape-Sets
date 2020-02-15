//
//  AudioUtil.swift
//  NShapeSets
//
//  Created by Shawn Roller on 2/15/20.
//  Copyright © 2020 offensively-bad. All rights reserved.
//

import Foundation
import AVKit
import AVFoundation
    
func playCountdownSound() {
    AudioServicesPlayAlertSound(1007)
}
    
func playDoneSound() {
    AudioServicesPlayAlertSound(1008)
}
