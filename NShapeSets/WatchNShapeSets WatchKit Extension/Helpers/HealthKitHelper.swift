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
    
    private var healthStore: HKHealthStore!
    private var config: HKWorkoutConfiguration!
    private var session: HKWorkoutSession!
    private var builder: HKLiveWorkoutBuilder!
    
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
    
    func setupHK() {
        let typesToShare: Set = [HKQuantityType.workoutType()]
        let typesToRead: Set = [
            HKQuantityType.quantityType(forIdentifier: .heartRate)!,
            HKQuantityType.quantityType(forIdentifier: .activeEnergyBurned)!
        ]
        
        healthStore.requestAuthorization(toShare: typesToShare, read: typesToRead) { (success, error) in
            
        }
    }
    
    func setupWorkout() {
        let config = HKWorkoutConfiguration()
        config.activityType = .traditionalStrengthTraining
        config.locationType = .unknown
        
        do {
            session = try HKWorkoutSession(healthStore: healthStore, configuration: config)
            builder = session.associatedWorkoutBuilder()
        }
        catch {
            // handle error
            return
        }
        
        builder.dataSource = HKLiveWorkoutDataSource(healthStore: healthStore, workoutConfiguration: config)
        
        session.delegate = self
        builder.delegate = self
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
    
}