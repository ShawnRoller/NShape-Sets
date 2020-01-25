//
//  InfoView.swift
//  NShapeSets
//
//  Created by Shawn Roller on 1/25/20.
//  Copyright © 2020 offensively-bad. All rights reserved.
//

import SwiftUI

struct InfoView: View {
    var imageString: String
    var text: String
    
    var body: some View {
        VStack {
            Image(imageString)
            Text("10")
                .foregroundColor(.white)
                .header2Font()
        }
    }
}

struct InfoView_Previews: PreviewProvider {
    static var previews: some View {
        InfoView(imageString: ImageAsset.currentSet, text: "10")
    }
}
