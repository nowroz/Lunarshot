//
//  Astronaut.swift
//  Lunarshot
//
//  Created by Nowroz Islam on 19/8/23.
//

import SwiftUI

struct Astronaut: Decodable {
    let id: String
    let name: String
    let description: String
}

fileprivate struct AstronautsKey: EnvironmentKey {
    static var defaultValue: [String: Astronaut] = [:]
}

extension EnvironmentValues {
    var astronauts: [String: Astronaut] {
        get {
            self[AstronautsKey.self]
        }
        
        set {
            self[AstronautsKey.self] = newValue
        }
    }
}
