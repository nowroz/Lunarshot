//
//  Bundle-Decodable.swift
//  Lunarshot
//
//  Created by Nowroz Islam on 19/8/23.
//

import Foundation

extension Bundle {
    func decode<T: Decodable>(file: String, withExtension ext: String) -> T {
        guard let url = url(forResource: file, withExtension: ext) else {
            fatalError("Failed to locate \(file).\(ext) in bundle.")
        }
        
        guard let data = try? Data(contentsOf: url) else {
            fatalError("Faile to laod \(file).\(ext) from bundle.")
        }
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "y-MM-dd"
        
        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .formatted(dateFormatter)
        
        guard let decodedContent = try? decoder.decode(T.self, from: data) else {
            fatalError("Failed to decode \(file).\(ext).")
        }
        
        return decodedContent
    }
}
