//
//  ActiveWorkoutView.swift
//  NShapeSets
//
//  Created by Shawn Roller on 1/25/20.
//  Copyright © 2020 offensively-bad. All rights reserved.
//

import SwiftUI
import HealthKit
import os

struct ActiveWorkoutView: View {
    @Environment(\.presentationMode) var presentationMode
    
    @State private var workoutState: ScreenState = .active
    @State private var showingAlert = false
    @State private var activeAlert: ActiveAlert = .done
    
    @ObservedObject var timer: TimerWrapper
    var workout: Workout
    @Binding var isPresented: Bool
    var healthManager: HealthManager?
    
    @State private var didSaveWorkout = false
    
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
                ZStack {
                    BannerView()
                    VStack {
                        Spacer()
                        Text("Total time: \(TimeHelper.getTimeFromSeconds(self.timer.totalTime))")
                            .italic()
                            .foregroundColor(.white)
                            .padding()
                    }
                }
                Spacer()
                getViewForState(workoutState)
                Spacer()
            }
            .onAppear() {
                os_log("Workout became active!", log: .ui)
                self.setDefaultSettings()
                self.timer.startTimeTracking()
            }
            .onDisappear() {
                let totalSeconds = self.timer.totalTime
                self.saveWorkout(withSeconds: totalSeconds)
                self.timer.reset()
            }
            .alert(isPresented: $showingAlert) {
                if (activeAlert == .done) {
                    self.timer.stopTimeTracking()
                    let totalSeconds = self.timer.totalTime
                    let totalTime = TimeHelper.getTimeFromSeconds(totalSeconds)
                    
                    return Alert(title: Text("Workout complete!"), message: Text("You completed all sets in \(totalTime)!"), dismissButton: .default(Text("OK"), action: {
                        self.goBack()
                    }))
                } else {
                    return Alert(title: Text("All done?"), primaryButton: .destructive(Text("Done!"), action: {
                        self.showingAlert = false
                        self.goBack()
                    }), secondaryButton: .cancel())
                }
            }
            .navigationBarBackButtonHidden(true)
            .navigationBarItems(leading: Button(action: {
                activeAlert = .back
                showingAlert = true
            }, label: {
                Image(systemName: "chevron.left.circle.fill")
                    .foregroundColor(.white)
                    .font(.system(size: 25))
            }))
        }
    }
    
    func setDefaultSettings() {
        let defaultWorkoutRest = self.workout.rest
        let defaultWorkoutSets = self.workout.sets
        
        os_log("Setting defaults - rest: %d, sets: %d", log: .ui, defaultWorkoutRest, defaultWorkoutSets)
        
        DefaultManager.setDefault(value: defaultWorkoutRest, forKey: Defaults.workoutRest)
        DefaultManager.setDefault(value: defaultWorkoutSets, forKey: Defaults.workoutRounds)
    }
    
    func saveWorkout(withSeconds seconds: Int) {
        os_log("Saving workout...", log: .ui)
        if !didSaveWorkout {
            didSaveWorkout = true
            
            let caloriesPerSecond = 0.16
            let calories = (caloriesPerSecond * Double(seconds)) * 1000
            
            //get workout times
            let userCalendar = Calendar.current
            let date = Date()
            var durationComponents = DateComponents()
            durationComponents.second = seconds * -1
            let startDate = (userCalendar as NSCalendar).date(byAdding: durationComponents, to: date, options: [])
            
            self.healthManager?.saveWorkout(calories, startDate: startDate!, endDate: date)
        }
    }
    
    func playSound() {
        os_log("Rest remaining: %d", log: .ui, timer.remainingRest)
    }
    
    func countdown() {
        if 1...3 ~= timer.remainingRest {
            playSound()
        }
    }
    
    func onRestEnd() {
        os_log("Rest is ", log: .ui)
        workoutState = workoutState == .active ? .rest : .active
        timer.restComplete()
    }
    
    func goBack() {
        os_log("Going back to setup...", log: .ui)
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
        os_log("Rest started", log: .ui)
        if timer.currentRound == timer.rounds {
            activeAlert = .done
            showingAlert = true
        }
        else {
            workoutState = workoutState == .active ? .rest : .active
            timer.start()
        }
    }
    
    func onSkip() {
        os_log("Rest was skipped", log: .ui)
        onRestEnd()
    }
}

struct ActiveWorkoutView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            ActiveWorkoutView(workout: Workout.example, isPresented: .constant(false), healthManager: nil)
        }
    }
}
