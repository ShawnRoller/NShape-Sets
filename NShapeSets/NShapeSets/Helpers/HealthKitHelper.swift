//
//  HealthKitHelper.swift
//  NShapeSets
//
//  Created by Shawn Roller on 4/17/20.
//  Copyright © 2020 offensively-bad. All rights reserved.
//

import Foundation
import HealthKit

class HealthManager {

    let healthKitStore: HKHealthStore = HKHealthStore()
    var didAuthorize = false
    
    /// TODO: this should use a completion
    func authorizeHealthKit() {
        
        //set the types to read from HKStore
        let healthKitTypesToRead = Set(arrayLiteral:
            HKObjectType.quantityType(forIdentifier: HKQuantityTypeIdentifier.heartRate)!,
            HKObjectType.workoutType()
            )
        
        //set the types to write to HKStore
        let healthKitTypesToWrite = Set(arrayLiteral:
            HKObjectType.quantityType(forIdentifier: HKQuantityTypeIdentifier.activeEnergyBurned)!,
            HKObjectType.workoutType()
        )
        
        //if store unavailable return an error
        if !HKHealthStore.isHealthDataAvailable() {
            self.didAuthorize = false
        }
        
        //request healthkit authorization
        healthKitStore.requestAuthorization(toShare: healthKitTypesToWrite, read: healthKitTypesToRead) { (success, error) -> Void in
            if success {
                self.didAuthorize = true
            }
            else {
                print(error as Any)
                self.didAuthorize = false
            }
        }
    }
    
    func readProfile() -> ( age:Int?,  biologicalsex:HKBiologicalSexObject?)
    {
        var age:Int?
        var biologicalSex: HKBiologicalSexObject = HKBiologicalSexObject()
        
        do {
            let birthDay = try healthKitStore.dateOfBirthComponents()
            let today = Date()
            let todayDateComponents = Calendar.current.dateComponents([.day, .month, .year], from: today)
            let differenceComponents = (Calendar.current as NSCalendar).components(NSCalendar.Unit.year, from: birthDay, to: todayDateComponents, options: NSCalendar.Options(rawValue: 0))
            
            age = differenceComponents.year
        } catch {
            print("error capturing age")
        }
        
        do {
            biologicalSex = try healthKitStore.biologicalSex()
        } catch {
            print("error capturing sex")
        }

        return (age, biologicalSex)
    }
    
    func readMostRecentSample(_ sampleType: HKSampleType, completion: ((HKSample?, NSError?) -> Void)!) {
        
        let past = Date.distantPast
        let now = Date()
        let mostRecentPredicate = HKQuery.predicateForSamples(withStart: past, end: now, options: HKQueryOptions())
        
        let sortDescriptor = NSSortDescriptor(key: HKSampleSortIdentifierStartDate, ascending: false)
        
        let limit = 1
        
        let sampleQuery = HKSampleQuery(sampleType: sampleType, predicate: mostRecentPredicate, limit: limit, sortDescriptors: [sortDescriptor]) { (sampleQuery, results, error) -> Void in
            
            if let _ = error {
                completion(nil, nil)
                return
            }
            
            let mostRecentSample = results!.first as? HKQuantitySample
            
            if completion != nil {
                completion(mostRecentSample, nil)
            }
            
        }
        
        self.healthKitStore.execute(sampleQuery)
        
    }
    
    func saveWorkout(_ calories: Double, startDate: Date, endDate: Date) {
        if self.didAuthorize {
            let energy = HKQuantityType.quantityType(forIdentifier: HKQuantityTypeIdentifier.activeEnergyBurned)
            let quantity = HKQuantity(unit: HKUnit.smallCalorie(), doubleValue: calories)
            let sample = HKQuantitySample(type: energy!, quantity: quantity, start: startDate, end: endDate)
            
            let distanceQuantity = HKQuantity(unit: HKUnit.meterUnit(with: .kilo), doubleValue: 0.0)
            let workout = HKWorkout(activityType: .crossTraining, start: startDate, end: endDate, duration: abs(endDate.timeIntervalSince(startDate)), totalEnergyBurned: quantity, totalDistance: distanceQuantity, metadata: nil)
            
            healthKitStore.save(sample, withCompletion: { (success, error) -> Void in
                
                if error != nil {
                    print("error saving calorie burn sample: \(String(describing: error?.localizedDescription))")
                } else {
                    print("calories saved successfully")
                    self.healthKitStore.save(workout, withCompletion: { (saved, errors) -> Void in
                        
                        if errors != nil {
                            print("error saving workout")
                        } else {
                            print("workout saved successfully")
                        }
                        
                    })
                }
                
            })
        }
        
    }
    
}