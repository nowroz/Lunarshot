//
//  MissionsGridView.swift
//  Lunarshot
//
//  Created by Nowroz Islam on 19/8/23.
//

import SwiftUI

struct MissionsGridView: View {
    @Environment(\.missions) private var missions
    
    let layout: [GridItem] = [
        GridItem(.adaptive(minimum: 150))
    ]
    
    var body: some View {
        ScrollView {
            LazyVGrid(columns: layout) {
                ForEach(missions) { mission in
                    NavigationLink {
                        MissionView(mission)
                    } label: {
                        VStack {
                            Image(mission.image)
                                .resizable()
                                .scaledToFit()
                                .frame(width: 100, height: 100)
                                .padding()
                            
                            VStack {
                                Text(mission.name)
                                     .font(.headline)
                                    .foregroundStyle(.black)
                                
                                Text(mission.formattedLaunchDate)
                                    .font(.subheadline)
                                    .foregroundStyle(.gray)
                            }
                            .padding(5)
                            .frame(maxWidth: .infinity)
                            .background(.white)
                        }
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                        .overlay {
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(.white)
                        }
                        .padding()
                    }
                }
            }
        }
        .navigationTitle("Lunarshot")
        .background(.appTheme)
    }
}

#Preview {
    NavigationStack {
        MissionsGridView()
            .environment(\.missions, ExtractedData.shared.missions)
            .environment(\.astronauts, ExtractedData.shared.astronauts)
            .preferredColorScheme(.dark)
    }
}
