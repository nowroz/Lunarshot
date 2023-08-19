//
//  AstronautView.swift
//  Lunarshot
//
//  Created by Nowroz Islam on 19/8/23.
//

import SwiftUI

struct AstronautView: View {
    let astronaut: Astronaut
    
    var body: some View {
        ScrollView {
            VStack {
                Image(astronaut.id)
                    .resizable()
                    .scaledToFit()
                
                Text(astronaut.description)
                    .padding()
            }
        }
        .navigationTitle(astronaut.name)
        .navigationBarTitleDisplayMode(.inline)
        .background(.appTheme)
    }
    
    init(_ astronaut: Astronaut) {
        self.astronaut = astronaut
    }
}

#Preview {
    NavigationStack {
        AstronautView(ExtractedData.shared.astronauts["armstrong"]!)
            .preferredColorScheme(.dark)
    }
}
