//
//  DataNotFoundError.swift
//  URLSessionSample
//
//  Created by Victor Pacheco on 14/02/23.
//

import Foundation

struct DataNotFoundError: Error {
    init() { }
}

extension DataNotFoundError: LocalizedError {
    var errorDescription: String? {
        "Ha ocurrido un error al obtener los datos."
    }
}
