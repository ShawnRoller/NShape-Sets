//
//  ActiveWorkoutView.swift
//  NShapeSets
//
//  Created by Shawn Roller on 1/25/20.
//  Copyright © 2020 offensively-bad. All rights reserved.
//

import SwiftUI
import HealthKit

struct ActiveWorkoutView: View {
    @Environment(\.presentationMode) var presentationMode
    
    @State private var workoutState: ScreenState = .active
    @State private var showingAlert = false
    
    @ObservedObject var timer: TimerWrapper
    var workout: Workout
    @Binding var isPresented: Bool
    var healthManager: HealthManager?
    
    init(workout: Workout, isPresented: Binding<Bool>, healthManager: HealthManager?) {
        self.workout = workout
        self._isPresented = isPresented
        self.timer = TimerWrapper.example
        self.healthManager = healthManager
    }
    
    var body: some View {
        ZStack {
            BackgroundView()
            VStack {
                BannerView()
                Spacer()
                getViewForState(workoutState)
                Spacer()
            }
            .onAppear() {
                self.timer.startTimeTracking()
            }
            .onDisappear() {
                let totalSeconds = self.timer.totalTime
                self.saveWorkout(withSeconds: totalSeconds)
                self.timer.reset()
            }
            .alert(isPresented: $showingAlert) {
                self.timer.stopTimeTracking()
                let totalSeconds = self.timer.totalTime
                let totalTime = TimeHelper.getTimeFromSeconds(totalSeconds)
                
                return Alert(title: Text("Workout complete!"), message: Text("You completed all sets in \(totalTime)!"), dismissButton: .default(Text("OK"), action: {
                    self.goBack()
                }))
            }
        }
    }
    
    func saveWorkout(withSeconds seconds: Int) {
        let caloriesPerSecond = 0.16
        let calories = (caloriesPerSecond * Double(seconds)) * 1000
        
        //get workout times
        let userCalendar = Calendar.current
        let date = Date()
        var durationComponents = DateComponents()
        durationComponents.second = seconds * -1
        let startDate = (userCalendar as NSCalendar).date(byAdding: durationComponents, to: date, options: [])
        
        print("startDate: \(startDate!)")
        print("endDate: \(date)")
        
        self.healthManager?.saveWorkout(calories, startDate: startDate!, endDate: date)
    }
    
    func playSound() {
        print("rest remaining: \(timer.remainingRest)")
    }
    
    func countdown() {
        if 1...3 ~= timer.remainingRest {
            playSound()
        }
    }
    
    func onRestEnd() {
        print("rest is over")
        workoutState = workoutState == .active ? .rest : .active
        timer.restComplete()
    }
    
    func goBack() {
        if isPresented {
            isPresented = false
        }
        else {
            presentationMode.wrappedValue.dismiss()
        }
    }
    
    func getViewForState(_ state: ScreenState) -> some View {
        return Group {
            if timer.isActive {
                RestView(workout: workout, timer: timer) {
                    self.onSkip()
                }
            }
            else {
                ActiveView(workout: workout, timer: timer) {
                    self.onRest()
                }
            }
        }
    }
    
    func onRest() {
        if timer.currentRound == timer.rounds {
            showingAlert = true
        }
        else {
            workoutState = workoutState == .active ? .rest : .active
            timer.start()
        }
    }
    
    func onSkip() {
        onRestEnd()
    }
}

struct ActiveWorkoutView_Previews: PreviewProvider {
    static var previews: some View {
        ActiveWorkoutView(workout: Workout.example, isPresented: .constant(false), healthManager: nil)
    }
}
