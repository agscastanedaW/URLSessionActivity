//
//  Saver.swift
//  URLSessionSample
//
//  Created by Victor Pacheco on 14/02/23.
//

protocol Saver {
    func saveData<T: Encodable>(data: T, key: String, completion: @escaping (Result<T, Error>) -> Void)
}
