//
//  NShapeSetsTests.swift
//  NShapeSetsTests
//
//  Created by Shawn Roller on 11/30/19.
//  Copyright © 2019 offensively-bad. All rights reserved.
//

import XCTest
@testable import NShapeSets
//import TimeHelper

class NShapeSetsTests: XCTestCase {
    
    @Clamping(initialValue: 1, 0...14) var ph: Int
    let timer = TimerWrapper(rest: 5, rounds: 2, currentRound: 1)
    
    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testTimeFromSeconds() {
        let time = TimeHelper.getTimeFromSeconds(90)
        XCTAssert(time == "01:30")
    }
    
    func testClamping() {
        self.ph = 18
        XCTAssert(self.ph == 14)
        
        self.ph = -4
        XCTAssert(self.ph == 0)
        
        self.ph = 7
        XCTAssert(self.ph == 7)
    }
    
    func testTimerProperties() {
        self.timer.reset()
        
        XCTAssert(self.timer.isActive == false)
        XCTAssert(self.timer.nextSetString == "Last Set")
        XCTAssert(self.timer.remainingRounds == 1)
    }
    
    func testTimerCountdown() {
        self.timer.reset()
        
        self.timer.countdown()
        XCTAssert(self.timer.remainingRest == 4)
        
        self.timer.countdown()
        XCTAssert(self.timer.remainingRest == 3)
        
        self.timer.countdown()
        XCTAssert(self.timer.remainingRest == 2)
        
        self.timer.countdown()
        XCTAssert(self.timer.remainingRest == 1)
        
        self.timer.countdown()
        XCTAssert(self.timer.remainingRest == 0)
        
        self.timer.restComplete()
        XCTAssert(self.timer.remainingRest == 5)
        XCTAssert(self.timer.currentRound == 2)
    }

}
