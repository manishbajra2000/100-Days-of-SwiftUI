//
//  Bundle-Decodable.swift
//  Moonshot
//
//  Created by Manish Harsha Bajracharya on 20/01/2025.
//

import Foundation

extension Bundle {
    func decode(_ file: String) -> [String: Astronaut] {
        guard let url = self.url(forResource: file, withExtension: nil) else {
            fatalError("Couldn't find \(file) in bundle.")
        }
        
        guard let data = try? Data(contentsOf: url) else {
            fatalError("Couldn't read \(file) as Data.")
        }
        
        let decoder = JSONDecoder()
        
//        guard let loaded = try? decoder.decode([String: Astronaut].self, from: data) else {
//            fatalError("Couldn't decode \(file) as [String: Astronaut].")
//        }
//        
//        return loaded
        
        do {
            return try decoder.decode([String: Astronaut].self, from: data)
        } catch DecodingError.keyNotFound(let key, let context) {
            fatalError("Failed to decode \(file) from the bundle due to missing key: \(key), \(context.debugDescription)")
        } catch DecodingError.typeMismatch(let type, let context) {
            fatalError("Failed to decode \(file) from the bundle due to type mismatch: \(type), \(context.debugDescription)")
        } catch DecodingError.valueNotFound(let type, let context) {
            fatalError("Failed to decode \(file) from the bundle due to value not found: \(type), \(context.debugDescription)")
        } catch DecodingError.dataCorrupted(let context) {
            fatalError("Failed to decode \(file) from the bundle due to data corruption: \(context.debugDescription)")
        } catch {
            fatalError("Failed to decode \(file) from the bundle: \(error.localizedDescription)")
        }
    }
}
