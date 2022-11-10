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
    var defaultSets: Int = 3
    
    func placeholder(in context: Context) -> SimpleEntry {
        SimpleEntry(date: Date(), sets: defaultSets, rest: REST, configuration: ConfigurationIntent())
    }

    func getSnapshot(for configuration: ConfigurationIntent, in context: Context, completion: @escaping (SimpleEntry) -> ()) {
        let entry = SimpleEntry(date: Date(), sets: defaultSets, rest: REST, configuration: configuration)
        
        if context.isPreview {
            // can return a default snapshot for the widget gallery
        }
        
        completion(entry)
    }

    func getTimeline(for configuration: ConfigurationIntent, in context: Context, completion: @escaping (Timeline<Entry>) -> ()) {
        let entry = SimpleEntry(date: Date(), sets: defaultSets, rest: REST, configuration: configuration)
        var entries: [SimpleEntry] = [entry]

        // Generate a timeline consisting of five entries an hour apart, starting from the current date.
//        let currentDate = Date()
//        for minuteOffset in 0 ..< 5 {
//            let entryDate = Calendar.current.date(byAdding: .minute, value: minuteOffset, to: currentDate)!
//            let entry = SimpleEntry(date: entryDate, sets: SETS, rest: REST, configuration: configuration)
//            entries.append(entry)
//        }
        
        let sets = DefaultManager.getDefault(forKey: Defaults.workoutRounds) as? Int
        print("sets: \(String(describing: sets))")

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
    let kind: String = "com.offensively-bad.nshapesets.quick-start"

    var body: some WidgetConfiguration {
        IntentConfiguration(kind: kind, intent: ConfigurationIntent.self, provider: Provider(defaultSets: getDefaultSets())) { entry in
            QuickStartWidgetEntryView(entry: entry)
        }
        .configurationDisplayName("Quick Start")
        .description("Quickly starts a workout")
    }
    
    func getDefaultSets() -> Int {
        let sets = DefaultManager.getDefault(forKey: Defaults.workoutRounds) as? Int
        print("sets: \(String(describing: sets))")
        return DefaultManager.getDefault(forKey: Defaults.workoutRounds) as? Int ?? 6
    }
}

struct QuickStartWidget_Previews: PreviewProvider {
    static var previews: some View {
        QuickStartWidgetEntryView(entry: SimpleEntry(date: Date(), sets: SETS, rest: REST, configuration: ConfigurationIntent()))
            .previewContext(WidgetPreviewContext(family: .systemSmall))
    }
}
