//
//  SetupView.swift
//  NShapeSets
//
//  Created by Shawn Roller on 12/2/19.
//  Copyright © 2019 offensively-bad. All rights reserved.
//

import SwiftUI

struct SetupView: View {
    
    @State private var sets = 8.0
    @State private var rest = 5.0
    @State private var isWorkoutActive = false
    @State private var bannerHeight: CGFloat = 300
    
    var body: some View {
        VStack {
            BannerView()
                .frame(height: self.bannerHeight)
            getSpacer()
            SelectorView(value: $sets, title: "Sets", range: 1.0...100.0, step: 1.0, image: ImageAsset.sets)
            getSpacer()
            SelectorView(value: $rest, title: "Rest", range: 1.0...100.0, step: 1.0, image: ImageAsset.rest)
            getSpacer()
            Image(ImageAsset.buttonStart)
                .onTapGesture {
                    self.isWorkoutActive.toggle()
                }
            Spacer()
        }
        .animation(.spring())
        .sheet(isPresented: $isWorkoutActive) {
            self.getWorkoutView()
        }
        .onAppear {
            self.handleKeyboardNotifications()
        }
    }
    
    func handleKeyboardNotifications() {
        NotificationCenter.default.addObserver(forName: UIResponder.keyboardWillShowNotification, object: nil, queue: .main) { (notification) in
            self.bannerHeight = 100
        }
        
        NotificationCenter.default.addObserver(forName: UIResponder.keyboardWillHideNotification, object: nil, queue: .main) { (notification) in
            self.bannerHeight = 300
        }
    }
    
    func getSpacer() -> some View {
        return Spacer()
                .frame(minHeight: 0, maxHeight: 10)
    }
    
    func getWorkoutView() -> some View {
        let workout = self.getWorkoutWith(sets: self.sets, rest: self.rest)
        let timer = TimerWrapper(rest: Int(self.rest), rounds: Int(self.sets), currentRound: 1)
        return ActiveWorkoutView(timer: timer, workout: workout)
    }
    
    func getWorkoutWith(sets: Double, rest: Double) -> Workout {
        let workout = Workout(sets: sets, rest: rest, currentSet: 1)
        return workout
    }
}

struct SetupView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            SetupView()
                .environment(\.colorScheme, .light)
            
            SetupView()
                .environment(\.colorScheme, .dark)
        }
    }
}
