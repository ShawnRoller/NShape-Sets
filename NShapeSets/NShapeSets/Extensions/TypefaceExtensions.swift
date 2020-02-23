//
//  TypeExtensions.swift
//  NShapeSets
//
//  Created by Shawn Roller on 12/14/19.
//  Copyright © 2019 offensively-bad. All rights reserved.
//
//  from: https://www.hackingwithswift.com/quick-start/swiftui/how-to-use-dynamic-type-with-a-custom-font

import SwiftUI

@available(iOS 13, macCatalyst 13, tvOS 13, watchOS 6, *)
struct ScaledFont: ViewModifier {
    @Environment(\.sizeCategory) var sizeCategory
    var name: String
    var size: CGFloat
    
    func body(content: Content) -> some View {
        let scaledSize = UIFontMetrics.default.scaledValue(for: size)
        return content.font(.custom(name, size: scaledSize))
    }
}

@available(iOS 13, macCatalyst 13, tvOS 13, watchOS 6, *)
extension View {
    func scaledFont(name: String, size: CGFloat) -> some View {
        return self.modifier(ScaledFont(name: name, size: size))
    }
    func inputFont() -> some View {
        return self.modifier(ScaledFont(name: "Gotham-Book", size:36))
    }
    func header1Font() -> some View {
        return self.modifier(ScaledFont(name: "Gotham-Book", size:60))
    }
    func header2Font() -> some View {
        return self.modifier(ScaledFont(name: "Gotham-Book", size:45))
    }
    func watchInputFont() -> some View {
        return self.modifier(ScaledFont(name: "Gotham-Book", size:26))
    }
    func watchHeader1Font() -> some View {
        return self.modifier(ScaledFont(name: "Gotham-Book", size:40))
    }
    func watchHeader2Font() -> some View {
        return self.modifier(ScaledFont(name: "Gotham-Book", size:20))
    }
    func watchTitleFont() -> some View {
        return self.modifier(ScaledFont(name: "Gotham-Book", size:22))
    }
    func watchInstructionFont() -> some View {
        return self.modifier(ScaledFont(name: "Gotham-Book", size:38))
    }
    func watchInstructionTitleFont() -> some View {
        return self.modifier(ScaledFont(name: "Gotham-Book", size:22))
    }
    func watchInstructionDetailFont() -> some View {
        return self.modifier(ScaledFont(name: "Gotham-Book", size:17))
    }
}
