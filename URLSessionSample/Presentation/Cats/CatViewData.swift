//
//  CatViewData.swift
//  URLSessionSample
//
//  Created by Victor Pacheco on 14/02/23.
//

/// Esta estructura representa una abstracción con los datos específicos que necesita la vista.
/// El closure `didSelect` nos permite desacoplar la vista los detalles de implementación del backend: (`Cat`, `Codable`, `Decodable`, `identifier`).
struct CatViewData {
    let breed: String
    let size: String
    let didSelect: () -> Void
    
    init(breed: String, size: String, selection: @escaping () -> Void) {
        self.breed = breed
        self.size = size
        self.didSelect = selection
    }
}
