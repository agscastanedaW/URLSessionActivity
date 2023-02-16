//
//  DogsServiceImp.swift
//  URLSessionSample
//
//  Created by Victor Pacheco on 16/02/23.
//

import Foundation

final class DogsServiceImp: DogsService {
    
    init() { }
    
    func getDogs() async throws -> [DogViewData] {
        // TODO: Replace this mock data list with real data from the server.
        let dogs = [DogViewData(breed: "Chihuahua", description: "This is mock data."),
                DogViewData(breed: "Pastor Alemán", description: "This is mock data.")]
        
        // TODO: Handle this error with a better description.
        guard !dogs.isEmpty else { throw NSError(domain: "Some error", code: 0, userInfo: [:]) }
        
        return dogs
    }
    
    func mapToViewData(_ dogs: [Dog]) -> [DogViewData] {
        dogs.map { DogViewData(breed: $0.breed,
                               description: "\($0.short_description) \($0.size_info)") }
    }
}

