//
//  DecodableResultAdapter.swift
//  URLSessionSample
//
//  Created by Victor Pacheco on 14/02/23.
//

import Foundation

protocol DecodableResultAdapter {
    func mapModel<T: Decodable>(data: Data) -> Result<T, Error>
}
