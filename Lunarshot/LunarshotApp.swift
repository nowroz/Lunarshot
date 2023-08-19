//
//  LunarshotApp.swift
//  Lunarshot
//
//  Created by Nowroz Islam on 18/8/23.
//

import SwiftUI

@main
struct LunarshotApp: App {
    let data: ExtractedData = .shared
    
    var body: some Scene {
        WindowGroup {
            HomeView()
                .environment(\.missions, data.missions)
                .environment(\.astronauts, data.astronauts)
                .preferredColorScheme(.dark)
        }
    }
}
