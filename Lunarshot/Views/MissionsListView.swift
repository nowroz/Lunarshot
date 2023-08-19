//
//  MissionsListView.swift
//  Lunarshot
//
//  Created by Nowroz Islam on 19/8/23.
//

import SwiftUI

struct MissionsListView: View {
    @Environment(\.missions) private var missions
    
    var body: some View {
        List(missions) { mission in
            Section {
                NavigationLink {
                    MissionView(mission)
                } label: {
                    HStack {
                        VStack(alignment: .leading) {
                            Text(mission.name)
                                .font(.headline)
                            
                            Text(mission.formattedLaunchDate)
                                .font(.subheadline)
                                .foregroundStyle(.secondary)
                        }
                        
                        Spacer()
                        
                        Image(mission.image)
                            .resizable()
                            .scaledToFit()
                            .frame(width: 80, height: 80)
                    }
                }
            }
            .listRowBackground(Color.appTheme)
        }
        .navigationTitle("Lunarshot")
    }
}

#Preview {
    NavigationStack {
        MissionsListView()
            .environment(\.missions, ExtractedData.shared.missions)
            .environment(\.astronauts, ExtractedData.shared.astronauts)
            .preferredColorScheme(.dark)
    }
}
