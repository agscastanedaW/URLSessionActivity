//
//  LocalFileFetcher.swift
//  URLSessionSample
//
//  Created by Victor Pacheco on 14/02/23.
//

import Foundation

final class LocalFileFetcher: Fetcher {
    
    private let fileName: String
    private let fileExtension: String
    private let decodableResultAdapter: DecodableResultAdapter
    
    init(fileName: String, fileExtension: String, decodableResultAdapter: DecodableResultAdapter) {
        self.fileName = fileName
        self.fileExtension = fileExtension
        self.decodableResultAdapter = decodableResultAdapter
    }
    
    func fetchData<T: Decodable>(completion: @escaping (Result<T, Error>) -> Void) {
        guard let fileUrl = Bundle.main.url(forResource: fileName, withExtension: fileExtension) else {
            return completion(.failure(DataNotFoundError()))
        }
        
        guard let content = try? String(contentsOf: fileUrl, encoding: .utf8) else {
            return completion(.failure(DataNotFoundError()))
        }
    
        guard let data = content.data(using: .utf8) else { return completion(.failure(DataNotFoundError())) }
        completion(decodableResultAdapter.mapModel(data: data))
    }
}
