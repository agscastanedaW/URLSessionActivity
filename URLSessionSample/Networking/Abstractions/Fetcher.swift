//
//  Fetcher.swift
//  URLSessionSample
//
//  Created by Victor Pacheco on 14/02/23.
//

protocol Fetcher {
    func fetchData<T: Decodable>(completion: @escaping (Result<T, Error>) -> Void)
}
