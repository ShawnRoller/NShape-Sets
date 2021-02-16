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
import os

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
        
        os_log("Authorizing HealthKit if necessary...", log: .healthKit)
        
        healthStore.requestAuthorization(toShare: typesToShare, read: typesToRead) { (success, error) in
            if (success) {
                os_log("Authorized HealthKit!", log: .healthKit)
                self.onHKAuth()
            } else {
                os_log("HeathKit failed auth: %{public}@", log: .healthKit, type: .error, error as CVarArg? ?? "")
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
        guard session == nil else { return }
        if self.config == nil {
            self.onHKAuth()
        }
        
        do {
            os_log("Setting up workout...", log: .healthKit)
            session = try HKWorkoutSession(healthStore: healthStore, configuration: config)
            builder = session.associatedWorkoutBuilder()
        }
        catch {
            os_log("HeathKit failed auth: %{public}@", log: .healthKit, type: .error, error as CVarArg? ?? "")
            return
        }
        
        session.delegate = self
        builder.delegate = self
        
        builder.dataSource = HKLiveWorkoutDataSource(healthStore: healthStore, workoutConfiguration: config)
    }
    
    func startWorkoutSession() {
        guard let session = session, ![HKWorkoutSessionState.paused, HKWorkoutSessionState.running].contains(session.state) else {
            os_log("startWorkoutSession - couldn't start workout!", log: .healthKit, type: .error)
            return
        }
        
        os_log("Starting workout...", log: .healthKit)
        
        session.startActivity(with: Date())
        builder.beginCollection(withStart: Date()) { (success, error) in
            guard success else {
                // handle error
                os_log("Couldn't begin collecting workout data", log: .healthKit, type: .error)
                return
            }
            
            // session has started
            os_log("Started collecting workout data...", log: .healthKit)
        }
    }
    
    func endWorkout() {
        /// Update the timer based on the state we are in.
        /// - Tag: SaveWorkout
        guard let session = session else {
            os_log("endWorkout - couldn't get the session!!", log: .healthKit, type: .error)
            return
        }
        
        os_log("Ending workout...", log: .healthKit)
        
        if session.state != .ended {
            session.end()
        }
    }
        
        func workoutSession(_ workoutSession: HKWorkoutSession, didChangeTo toState: HKWorkoutSessionState, from fromState: HKWorkoutSessionState, date: Date) {
            if toState == .ended {
                builder.endCollection(withEnd: Date()) { (success, error) in
                    self.builder.finishWorkout { (workout, error) in
                        if (error != nil) {
                            os_log("HeathKit failed auth: %{public}@", log: .healthKit, type: .error, error as CVarArg? ?? "")
                        } else {
                            os_log("Finalized workout: %@", log: .healthKit, workout ?? "")
                        }
                        
                        os_log("Resetting session...")
                        self.session = nil
                    }
                }
            }
        }
        
        func workoutSession(_ workoutSession: HKWorkoutSession, didFailWithError error: Error) {
            os_log("Workout session failed: %@", log: .healthKit, error.localizedDescription)
        }
        
        func workoutBuilder(_ workoutBuilder: HKLiveWorkoutBuilder, didCollectDataOf collectedTypes: Set<HKSampleType>) {
    //        for type in collectedTypes {
    //            guard let quantityType = type as? HKQuantityType else {
    //                return // Nothing to do.
    //            }
                
                /// - Tag: GetStatistics
    //            let statistics = workoutBuilder.statistics(for: quantityType)
    //            let label = labelForQuantityType(quantityType)
    //
    //            updateLabel(label, withStatistics: statistics)
    //        }
        }
        
        func workoutBuilderDidCollectEvent(_ workoutBuilder: HKLiveWorkoutBuilder) {
            // Retreive the workout event.
    //        guard let workoutEventType = workoutBuilder.workoutEvents.last?.type else { return }
            
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
    
}
