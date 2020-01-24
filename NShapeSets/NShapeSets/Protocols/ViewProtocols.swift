//
//  ViewProtocols.swift
//  NShapeSets
//
//  Created by Shawn Roller on 1/24/20.
//  Copyright © 2020 offensively-bad. All rights reserved.
//

import SwiftUI

protocol SelectorProtocol: View {
    var value: Double { get set }
    var title: String { get set }
    var range: ClosedRange<Double> { get set }
    var step: Double { get set }
    var image: String? { get set }
}
