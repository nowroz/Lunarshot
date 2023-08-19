//
//  ExtractedData.swift
//  Lunarshot
//
//  Created by Nowroz Islam on 19/8/23.
//

import Foundation

final class ExtractedData {
    let missions: [Mission] = Bundle.main.decode(file: "missions", withExtension: "json")
    let astronauts: [String: Astronaut] = Bundle.main.decode(file: "astronauts", withExtension: "json")
    
    private init() { }
    
    static let shared: ExtractedData = ExtractedData()
}

