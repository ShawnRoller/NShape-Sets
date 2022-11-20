//
//  QuickStartWidget.swift
//  QuickStartWidget
//
//  Created by Shawn Roller on 11/9/22.
//  Copyright © 2022 offensively-bad. All rights reserved.
//

import WidgetKit
import SwiftUI
import Intents

let SETS = 16
let REST = 90

struct Provider: TimelineProvider {
    var defaultSets: Int {
        QuickStartWidgetDefaultManager.getDefaultSets()
    }
    var defaultRest: Int {
        QuickStartWidgetDefaultManager.getDefaultRest()
    }
    
    func placeholder(in context: Context) -> SimpleEntry {
        SimpleEntry(date: Date(), sets: defaultSets, rest: defaultRest)
    }

    func getSnapshot( in context: Context, completion: @escaping (SimpleEntry) -> ()) {
        let entry = SimpleEntry(date: Date(), sets: defaultSets, rest: defaultRest)
        
        if context.isPreview {
            // can return a default snapshot for the widget gallery
        }
        
        completion(entry)
    }

    func getTimeline(in context: Context, completion: @escaping (Timeline<Entry>) -> ()) {
        let entry = SimpleEntry(date: Date(), sets: defaultSets, rest: defaultRest)
        let entries: [SimpleEntry] = [entry]

        let timeline = Timeline(entries: entries, policy: .never)
        completion(timeline)
    }
}

struct SimpleEntry: TimelineEntry {
    var date: Date
    let sets: Int
    let rest: Int
}

struct QuickStartWidgetEntryView : View {
    var entry: Provider.Entry
    
    var body: some View {
        ZStack() {
            BackgroundView()
            VStack {
                HStack(alignment: .top) {
                    Image("Banner-NShapeSets")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .rotationEffect(.degrees(-35))
                        .offset(x: -10, y: -5)
                        .frame(width: 70)
                        .padding(.leading, 4)
                    VStack(alignment: .trailing) {
                        InfoText("\(entry.sets) sets")
                        InfoText("\(entry.rest)s rest")
                    }
                }
                Image("Button-Start")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .padding()
            }
            padding()
        }
    }
}

struct QuickStartWidget: Widget {
    let kind: String = Constants.quickStartWidgetKind

    var body: some WidgetConfiguration {
        StaticConfiguration(kind: kind, provider: Provider()) { entry in
            QuickStartWidgetEntryView(entry: entry)
                .widgetURL(DeepLink.quickStartUrl)
        }
        .configurationDisplayName("Quick Start")
        .description("Quickly starts a workout")
    }
}

struct QuickStartWidgetDefaultManager {
    static func getDefaultSets() -> Int {
        let sets = DefaultManager.getDefault(forKey: Defaults.workoutRounds) as? Int ?? SETS
        return sets
    }
    
    static func getDefaultRest() -> Int {
        let rest = DefaultManager.getDefault(forKey: Defaults.workoutRest) as? Int ?? REST
        return rest
    }
}

struct QuickStartWidget_Previews: PreviewProvider {
    static var previews: some View {
        QuickStartWidgetEntryView(entry: SimpleEntry(date: Date(), sets: SETS, rest: REST))
            .previewContext(WidgetPreviewContext(family: .systemSmall))
    }
}
