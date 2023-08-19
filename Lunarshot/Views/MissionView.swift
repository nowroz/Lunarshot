//
//  MissionView.swift
//  Lunarshot
//
//  Created by Nowroz Islam on 19/8/23.
//

import SwiftUI

struct MissionView: View {
    let mission: Mission
    
    var body: some View {
        GeometryReader { geoProxy in
            ScrollView {
                VStack {
                    Image(mission.image)
                        .resizable()
                        .scaledToFit()
                        .frame(width: geoProxy.size.width * 0.8)
                        .padding()
                    
                    LabeledContent("Launch Date") {
                        Text(mission.formattedLaunchDate)
                    }
                    .padding()
                    
                    Divider()
                        .padding(.horizontal)
                    
                    VStack(alignment: .leading) {
                        Text("Mission Highlights")
                            .font(.title)
                            .padding(.bottom)
                        
                        Text(mission.description)
                    }
                    .padding()
                    
                    Divider()
                        .padding(.horizontal)
                    
                    VStack(alignment: .leading) {
                        Text("Crew")
                            .font(.title)
                            .padding()
                        
                        CrewView(mission)
                    }
                }
                .frame(maxWidth: .infinity)
            }
        }
        .navigationTitle(mission.name)
        .navigationBarTitleDisplayMode(.inline)
        .background(.appTheme)
    }
    
    init(_ mission: Mission) {
        self.mission = mission
    }
}

#Preview {
    NavigationStack{
        MissionView(ExtractedData.shared.missions[1])
            .environment(\.missions, ExtractedData.shared.missions)
            .environment(\.astronauts, ExtractedData.shared.astronauts)
            .preferredColorScheme(.dark)
    }
}
