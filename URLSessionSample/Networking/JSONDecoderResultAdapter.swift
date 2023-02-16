//
//  JSONDecoderResultAdapter.swift
//  URLSessionSample
//
//  Created by Victor Pacheco on 14/02/23.
//

import Foundation

public final class JSONDecoderResultAdapter: DecodableResultAdapter {
    
    private let decoder: JSONDecoder
    
    private struct ModelDecodingError: Error { }
    
    public init(decoder: JSONDecoder) {
        self.decoder = decoder
    }
    
    public func mapModel<T: Decodable>(data: Data) -> Result<T, Error> {
        guard let response = try? decoder.decode(T.self, from: data) else {
            return .failure(ModelDecodingError())
        }
        return .success(response)
    }
}
