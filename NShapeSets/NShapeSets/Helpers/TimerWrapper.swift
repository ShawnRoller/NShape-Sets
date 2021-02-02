//
//  TimerWrapper.swift
//  NShapeSets
//
//  Created by Shawn Roller on 2/4/20.
//  Copyright © 2020 offensively-bad. All rights reserved.
//

import SwiftUI

class TimerWrapper: ObservableObject {
    var timer: Timer?
    var rest: Int = 0
    var rounds: Int = 0
    @Published var remainingRest = 0
    @Published var currentRound = 1
    var startDate: Date?
    var isActive: Bool {
        return timer?.isValid ?? false
    }
    var nextSetString: String {
        let nextSet = self.currentRound + 1
        let finalString = nextSet == self.rounds ? "Last Set" : "\(nextSet) of \(self.rounds)"
        return finalString
    }
    var remainingRounds: Int {
        return self.rounds - self.currentRound
    }
    
    var onRestComplete: () -> Void?
    var onRestTimeChange: () -> Void?
    
    // Track total active time
    var totalTimer: Timer?
    var totalTime = 0
    var totalStartDate: Date?
    
    init(rest: Int, rounds: Int, currentRound: Int, _ onRestComplete: @escaping () -> Void?, onRestTimeChange: @escaping () -> Void?) {
        self.rest = rest
        self.rounds = rounds
        self.remainingRest = rest
        self.currentRound = currentRound
        self.onRestComplete = onRestComplete
        self.onRestTimeChange = onRestTimeChange
    }
    
    func start() {
        self.timer?.invalidate()
        self.timer = nil
        let newTimer = Timer(timeInterval: 1.0,
                        target: self,
                        selector: #selector(countdown),
                        userInfo: nil,
                        repeats: true)
        RunLoop.current.add(newTimer, forMode: .default)
        newTimer.tolerance = 0.1
        self.timer = newTimer
        self.startDate = Date()
    }
    
    @objc func countdown() {
        DispatchQueue.main.async {
            self.onRestTimeChange()
            self.remainingRest = self.rest - Int(Date().timeIntervalSince(self.startDate ?? Date()))
            if self.remainingRest < 0 {
                self.onRestComplete()
            }
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
        self.currentRound = 1
        self.remainingRest = rest
        
        self.totalTimer?.invalidate()
        self.totalTime = 0
    }
    
    func pause() {
        self.timer?.invalidate()
        self.totalTimer?.invalidate()
    }
    
    @objc func incrementTotalTime() {
        self.totalTime = Int(Date().timeIntervalSince(self.totalStartDate ?? Date()))
    }
    
    func startTimeTracking() {
        if self.totalTime == 0 {
            self.totalTimer?.invalidate()
            self.totalTimer = nil
            let newTimer = Timer(timeInterval: 1.0,
                            target: self,
                            selector: #selector(incrementTotalTime),
                            userInfo: nil,
                            repeats: true)
            RunLoop.current.add(newTimer, forMode: .default)
            newTimer.tolerance = 0.1
            self.totalTimer = newTimer
            self.totalStartDate = Date()
        }
    }
    
    func stopTimeTracking() {
        self.totalTimer?.invalidate()
    }
    
    static let example = TimerWrapper(rest: 3, rounds: 4, currentRound: 1) { () -> Void? in
        return
    } onRestTimeChange: { () -> Void? in
        return
    }

}
