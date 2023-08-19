//
//  ContentView.swift
//  Lunarshot
//
//  Created by Nowroz Islam on 18/8/23.
//

import SwiftUI

struct HomeView: View {
    @State private var showingAsList: Bool = false
    
    var body: some View {
        NavigationStack {
            Group {
                if showingAsList {
                    MissionsListView()
                } else {
                    MissionsGridView()
                }
            }
            .toolbar {
                Button {
                    showingAsList.toggle()
                } label: {
                    Label(showingAsList ? "Show as a grid" : "Show as a list", systemImage: showingAsList ? "square.grid.2x2.fill" : "list.dash")
                }
            }
        }
    }
}

#Preview {
    HomeView()
        .environment(\.missions, ExtractedData.shared.missions)
        .environment(\.astronauts, ExtractedData.shared.astronauts)
        .preferredColorScheme(.dark)
}
