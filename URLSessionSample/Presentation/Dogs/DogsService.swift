//
//  DogsService.swift
//  URLSessionSample
//
//  Created by Victor Pacheco on 16/02/23.
//

import Foundation

/// Este protocolo es la abstracción de la que depende nuestra vista.
/// A través de ella le proveemos datos presentables (`DogViewData`).
protocol DogsService {
    func getDogs() async throws -> [DogViewData]
}
