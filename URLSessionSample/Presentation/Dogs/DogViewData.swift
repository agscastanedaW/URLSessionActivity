//
//  DogViewData.swift
//  URLSessionSample
//
//  Created by Victor Pacheco on 16/02/23.
//

/// Esta estructura representa una abstracción con los datos específicos que necesita la vista.
struct DogViewData {
    let breed: String
    let description: String
    
    init(breed: String, description: String) {
        self.breed = breed
        self.description = description
    }
}
