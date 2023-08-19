//
//  CrewView.swift
//  Lunarshot
//
//  Created by Nowroz Islam on 19/8/23.
//

import SwiftUI

struct CrewView: View {
    @Environment(\.astronauts) private var astronauts
    
    let mission: Mission
    
    var body: some View {
        ScrollView(.horizontal) {
            HStack {
                ForEach(mission.crew) { member in
                    NavigationLink {
                        AstronautView(getAstronaut(member.name))
                    } label: {
                        HStack {
                            Image(member.name)
                                .resizable()
                                .scaledToFit()
                                .frame(width: 104)
                                .clipShape(Circle())
                                .overlay {
                                    Circle()
                                        .strokeBorder(.white)
                                }
                            
                            VStack(alignment: .leading) {
                                Text(getAstronaut(member.name).name)
                                    .font(.headline)
                                    .foregroundStyle(.white)
                                
                                Text(member.role)
                                    .font(.subheadline)
                                    .foregroundStyle(.gray)
                            }
                        }
                    }
                    .padding(.trailing)
                }
            }
        }
        .scrollIndicators(.hidden)
        .background(.appTheme)
    }
    
    func getAstronaut(_ key: String) -> Astronaut {
        astronauts[key]!
    }
    
    init(_ mission: Mission) {
        self.mission = mission
    }
}

#Preview {
    NavigationStack {
        CrewView(ExtractedData.shared.missions[0])
            .environment(\.astronauts, ExtractedData.shared.astronauts)
            .preferredColorScheme(.dark)
    }
}
