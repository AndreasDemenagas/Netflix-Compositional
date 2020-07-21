//
//  SeasonHeaderButton.swift
//  Netflix-Compositional
//
//  Created by Andrew Demenagas on 21/7/20.
//  Copyright © 2020 Andrew Demenagas. All rights reserved.
//

import SwiftUI

struct SeasonHeaderButton: View {
    var body: some View {
        HStack {
            Image(systemName: "play.fill")
            Text("Watch Now")
        }
        .padding()
        .font(.largeTitle)
        .background(Color.white)
        .cornerRadius(10)
    }
}

struct SeasonHeaderButton_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            Color.black
            SeasonHeaderButton()
        }
    }
}
