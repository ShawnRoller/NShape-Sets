//
//  TimerWrapper.swift
//  NShapeSets
//
//  Created by Shawn Roller on 2/4/20.
//  Copyright © 2020 offensively-bad. All rights reserved.
//

import SwiftUI

class TimerWrapper: ObservableObject {
    var timer: Timer!
    var rest: Int = 0
    var rounds: Int = 0
    @Published var remainingRest = 0
    @Published var currentRound = 1
    
    init(rest: Int, rounds: Int) {
        self.rest = rest
        self.rounds = rounds
        self.remainingRest = rest
    }
    
    func start() {
        self.timer?.invalidate()
        self.timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true, block: { (theTimer) in
            self.remainingRest -= 1
            if self.remainingRest < 0 {
                self.restComplete()
            }
        })
    }
    
    func restComplete() {
        if currentRound + 1 <= rounds {
            timer?.invalidate()
            currentRound += 1
            remainingRest = rest
        }
        else {
            reset()
        }
    }
    
    func reset() {
        self.timer?.invalidate()
        self.remainingRest = 0
        self.currentRound = 1
        self.remainingRest = rest
    }
    
    func pause() {
        self.timer?.invalidate()
    }
}
