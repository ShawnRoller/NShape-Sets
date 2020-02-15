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

var audioPlayer: AVAudioPlayer?
    
func playCountdownSound() {
    AudioServicesPlayAlertSound(1007)
}
    
func playDoneSound() {
    AudioServicesPlayAlertSound(1008)
}

func playSound(named file: String, ext: String) {
    guard let path = Bundle.main.path(forResource: file, ofType: ext) else {
        return
    }
    do {
        audioPlayer = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: path))
        audioPlayer?.play()
    }
    catch {
        print("Could not find sound file: \(file).\(ext)")
    }
}
