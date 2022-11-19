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

struct Provider: IntentTimelineProvider {
    var defaultSets: Int = SETS
    var defaultRest: Int = REST
    
    func placeholder(in context: Context) -> SimpleEntry {
        SimpleEntry(date: Date(), sets: defaultSets, rest: defaultRest, configuration: ConfigurationIntent())
    }

    func getSnapshot(for configuration: ConfigurationIntent, in context: Context, completion: @escaping (SimpleEntry) -> ()) {
        let entry = SimpleEntry(date: Date(), sets: defaultSets, rest: defaultRest, configuration: configuration)
        
        if context.isPreview {
            // can return a default snapshot for the widget gallery
        }
        
        completion(entry)
    }

    func getTimeline(for configuration: ConfigurationIntent, in context: Context, completion: @escaping (Timeline<Entry>) -> ()) {
        let entry = SimpleEntry(date: Date(), sets: defaultSets, rest: defaultRest, configuration: configuration)
        let entries: [SimpleEntry] = [entry]

        let timeline = Timeline(entries: entries, policy: .never)
        completion(timeline)
    }
}

struct SimpleEntry: TimelineEntry {
    var date: Date
    let sets: Int
    let rest: Int
    let configuration: ConfigurationIntent
}

struct QuickStartWidgetEntryView : View {
    var entry: Provider.Entry

    var body: some View {
        VStack {
            Text("Sets: \(entry.sets)")
            Text("Rest: \(entry.rest)")
            Text("Go!")
        }
    }
}

struct QuickStartWidget: Widget {
    let kind: String = Constants.quickStartWidgetKind

    var body: some WidgetConfiguration {
        IntentConfiguration(kind: kind, intent: ConfigurationIntent.self, provider: Provider(defaultSets: getDefaultSets(), defaultRest: getDefaultRest())) { entry in
            QuickStartWidgetEntryView(entry: entry)
        }
        .configurationDisplayName("Quick Start")
        .description("Quickly starts a workout")
    }
    
    func getDefaultSets() -> Int {
        let sets = DefaultManager.getDefault(forKey: Defaults.workoutRounds) as? Int ?? SETS
        return sets
    }
    
    func getDefaultRest() -> Int {
        let rest = DefaultManager.getDefault(forKey: Defaults.workoutRest) as? Int ?? REST
        return rest
    }
}

struct QuickStartWidget_Previews: PreviewProvider {
    static var previews: some View {
        QuickStartWidgetEntryView(entry: SimpleEntry(date: Date(), sets: SETS, rest: REST, configuration: ConfigurationIntent()))
            .previewContext(WidgetPreviewContext(family: .systemSmall))
    }
}
