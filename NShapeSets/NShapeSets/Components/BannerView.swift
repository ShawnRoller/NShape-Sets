//
//  BannerView.swift
//  NShapeSets
//
//  Created by Shawn on 1/20/20.
//  Copyright © 2020 offensively-bad. All rights reserved.
//

import SwiftUI

struct BannerView: View {
    
    var body: some View {
        Image("Banner-NShapeSets")
            .resizable()
            .aspectRatio(contentMode: .fit)
            .padding()
    }
}

struct BannerView_Previews: PreviewProvider {
    static var previews: some View {
        BannerView()
    }
}
