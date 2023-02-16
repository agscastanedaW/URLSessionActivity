//
//  CatsService.swift
//  URLSessionSample
//
//  Created by Victor Pacheco on 14/02/23.
//

import Foundation

/// Este protocolo es la abstracción de la que depende nuestra vista.
/// A través de ella le proveemos datos presentables (`CatViewData`).
protocol CatsService {
    func getCats(completion: @escaping (Result<[CatViewData], Error>) -> Void)
}
