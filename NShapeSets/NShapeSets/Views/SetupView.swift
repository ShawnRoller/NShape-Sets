//
//  SetupView.swift
//  NShapeSets
//
//  Created by Shawn Roller on 12/2/19.
//  Copyright © 2019 offensively-bad. All rights reserved.
//

import SwiftUI

struct SetupView: View {
    var healthManager: HealthManager?
    
    @State private var sets = 8.0
    @State private var rest = 5.0
    @State private var isWorkoutActive = false
    @State private var bannerHeight: CGFloat = 300
    
    private var useModal = false
    
    init(healthManager: HealthManager?) {
        self.healthManager = healthManager
    }
    
    var body: some View {
        Group {
            VStack {
                BannerView()
                    .frame(height: self.bannerHeight)
                getSpacer()
                SelectorView(value: $sets, title: "Sets", range: 1.0...100.0, step: 1.0, image: ImageAsset.sets)
                getSpacer()
                SelectorView(value: $rest, title: "Rest", range: 1.0...100.0, step: 1.0, image: ImageAsset.rest)
                getSpacer()
                renderStartButton(useModal: useModal)
                Spacer()
                Text(App.version)
                    .footerFont()
                    .accentColor(Palette.inactiveColor)
            }
            .animation(.spring())
            .sheet(isPresented: $isWorkoutActive) {
                if self.useModal {
                    self.getWorkoutView()
                }
            }
            .onAppear() {
                self.getDefaultSettings()
            }
        }.modifier(AdaptsToSoftwareKeyboard())
    }
    
    func getDefaultSettings() {
        let defaultWorkoutRest = DefaultManager.getDefault(forKey: Defaults.workoutRest) as? Double ?? 5
        let defaultWorkoutSets = DefaultManager.getDefault(forKey: Defaults.workoutRounds) as? Double ?? 10
        
        self.rest = defaultWorkoutRest
        self.sets = defaultWorkoutSets
    }
    
    func renderStartButton(useModal: Bool) -> some View {
        return Group {
            if useModal {
                Image(ImageAsset.buttonStart)
                    .onTapGesture {
                        self.isWorkoutActive.toggle()
                    }
            }
            else {
                NavigationLink(destination: getWorkoutView()) {
                    Image(ImageAsset.buttonStart)
                }
                .buttonStyle(PlainButtonStyle())
            }
        }
        
    }
    
    func getSpacer() -> some View {
        return Spacer()
                .frame(minHeight: 0, maxHeight: 10)
    }
    
    func getWorkoutView() -> some View {
        let workout = self.getWorkoutWith(sets: self.sets, rest: self.rest)
        var workoutView = ActiveWorkoutView(workout: workout, isPresented: $isWorkoutActive, healthManager: self.healthManager)
        
        // Setup timer
        let timer = TimerWrapper(rest: Int(self.rest), rounds: Int(self.sets), currentRound: 1, {
            workoutView.onRestEnd()
        }) {
            workoutView.countdown()
        }
        workoutView.timer = timer
        
        return workoutView
    }
    
    func getWorkoutWith(sets: Double, rest: Double) -> Workout {
        let workout = Workout(sets: sets, rest: rest, currentSet: 1)
        return workout
    }
}

struct SetupView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            SetupView(healthManager: nil)
                .environment(\.colorScheme, .light)
            
            SetupView(healthManager: nil)
                .environment(\.colorScheme, .dark)
        }
    }
}
