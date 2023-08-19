//
//  Mission.swift
//  Lunarshot
//
//  Created by Nowroz Islam on 19/8/23.
//

import SwiftUI

struct Mission: Decodable, Identifiable {
    let id: Int
    let launchDate: Date?
    let crew: [CrewMember]
    let description: String
}

extension Mission {
    struct CrewMember: Decodable, Identifiable {
        let name: String
        let role: String
        
        var id: String {
            name
        }
    }
}

extension Mission {
    var name: String {
        "Apollo \(id)"
    }
    
    var image: String {
        "apollo\(id)"
    }
    
    var formattedLaunchDate: String {
        launchDate?.formatted(date: .abbreviated, time: .omitted) ?? "N/A"
    }
}

fileprivate struct MissionsKey: EnvironmentKey {
    static var defaultValue: [Mission] = []
}

extension EnvironmentValues {
    var missions: [Mission] {
        get {
            self[MissionsKey.self]
        }
        
        set {
            self[MissionsKey.self] = newValue
        }
    }
}
