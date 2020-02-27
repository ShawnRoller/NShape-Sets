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
    var isActive: Bool {
        return timer != nil ? timer.isValid : false
    }
    
    var onRestComplete: () -> Void?
    var onRestTimeChange: () -> Void?
    
    init(rest: Int, rounds: Int, currentRound: Int, _ onRestComplete: @escaping () -> Void? = {}, onRestTimeChange: @escaping () -> Void? = {}) {
        self.rest = rest
        self.rounds = rounds
        self.remainingRest = rest
        self.currentRound = currentRound
        self.onRestComplete = onRestComplete
        self.onRestTimeChange = onRestTimeChange
    }
    
    func start() {
        self.timer?.invalidate()
        self.timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true, block: { (theTimer) in
            self.countdown()
        })
    }
    
    func countdown() {
        onRestTimeChange()
        self.remainingRest -= 1
        if self.remainingRest < 0 {
            self.onRestComplete()
        }
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
    
    #if DEBUG
    static let example = TimerWrapper(rest: 3, rounds: 4, currentRound: 1)
    #endif
}
