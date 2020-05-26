//
//  HealthKitHelper.swift
//  NShapeSets
//
//  Created by Shawn Roller on 3/8/20.
//  Copyright © 2020 offensively-bad. All rights reserved.
//

import WatchKit
import Foundation
import HealthKit

class HealthKitHelper: WKInterfaceController, HKWorkoutSessionDelegate, HKLiveWorkoutBuilderDelegate {
    
    private var context: WorkoutSessionContext!
    private var healthStore = HKHealthStore()
    private var config: HKWorkoutConfiguration!
    private var session: HKWorkoutSession!
    private var builder: HKLiveWorkoutBuilder!
    
    func setupHK() {
        let typesToShare: Set = [HKQuantityType.workoutType()]
        let typesToRead: Set = [
            HKQuantityType.quantityType(forIdentifier: .heartRate)!,
            HKQuantityType.quantityType(forIdentifier: .activeEnergyBurned)!
        ]
        
        healthStore.requestAuthorization(toShare: typesToShare, read: typesToRead) { (success, error) in
            /// TODO: handle error
            if (success) {
                self.onHKAuth()
            }
        }
    }
    
    func getWorkoutConfig() -> HKWorkoutConfiguration {
        let config = HKWorkoutConfiguration()
        config.activityType = .traditionalStrengthTraining
        config.locationType = .unknown
        return config
    }
    
    func onHKAuth() {
        self.config = getWorkoutConfig()
        self.context = WorkoutSessionContext(healthStore: self.healthStore, configuration: self.config)
    }
    
    func getContext() -> WorkoutSessionContext {
        return self.context
    }
    
    func setupWorkout() {
        
        do {
            session = try HKWorkoutSession(healthStore: healthStore, configuration: config)
            builder = session.associatedWorkoutBuilder()
        }
        catch {
            print("had error")
            return
        }
        
        session.delegate = self
        builder.delegate = self
        
        builder.dataSource = HKLiveWorkoutDataSource(healthStore: healthStore, workoutConfiguration: config)
    }
    
    func workoutSession(_ workoutSession: HKWorkoutSession, didChangeTo toState: HKWorkoutSessionState, from fromState: HKWorkoutSessionState, date: Date) {
        // Dispatch to main, because we are updating the interface.
        DispatchQueue.main.async {
            // update the UI based on state
        }
    }
    
    func workoutSession(_ workoutSession: HKWorkoutSession, didFailWithError error: Error) {
        DispatchQueue.main.async {
            // update the UI based on state
        }
    }
    
    func workoutBuilder(_ workoutBuilder: HKLiveWorkoutBuilder, didCollectDataOf collectedTypes: Set<HKSampleType>) {
        for type in collectedTypes {
            guard let quantityType = type as? HKQuantityType else {
                return // Nothing to do.
            }
            
            /// - Tag: GetStatistics
//            let statistics = workoutBuilder.statistics(for: quantityType)
//            let label = labelForQuantityType(quantityType)
//
//            updateLabel(label, withStatistics: statistics)
        }
    }
    
    func workoutBuilderDidCollectEvent(_ workoutBuilder: HKLiveWorkoutBuilder) {
        // Retreive the workout event.
        guard let workoutEventType = workoutBuilder.workoutEvents.last?.type else { return }
        
        // Update the timer based on the event received.
//        switch workoutEventType {
//        case .pause: // The user paused the workout.
//            setDurationTimerDate(.paused)
//        case .resume: // The user resumed the workout.
//            setDurationTimerDate(.running)
//        default:
//            return
//
//        }
    }
    
    func startWorkoutSession() {
        session.startActivity(with: Date())
        builder.beginCollection(withStart: Date()) { (success, error) in
            guard success else {
                // handle error
                return
            }
            
            // session has started
        }
    }
    
    func endWorkout() {
        /// Update the timer based on the state we are in.
        /// - Tag: SaveWorkout
        if session.state != .ended {
            session.end()
            builder.endCollection(withEnd: Date()) { (success, error) in
                self.builder.finishWorkout { (workout, error) in
                    
                }
            }
        }
    }
    
}
