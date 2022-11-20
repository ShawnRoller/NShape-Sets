//
//  InfoText.swift
//  QuickStartWidgetExtension
//
//  Created by Shawn Roller on 11/20/22.
//  Copyright © 2022 offensively-bad. All rights reserved.
//

import SwiftUI

struct InfoText: View {
    var text: String
    
    public init(_ text: String) {
        self.text = text
    }
    
    var body: some View {
        Text(text)
            .foregroundColor(.white)
            .widgetInfoFont()
    }
    
}
