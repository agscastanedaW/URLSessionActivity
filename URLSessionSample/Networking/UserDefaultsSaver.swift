//
//  UserDefaultsSaver.swift
//  URLSessionSample
//
//  Created by Victor Pacheco on 14/02/23.
//

import Foundation

public final class UserDefaultsSaver: Saver {
    
    public init() { }
    
    public func saveData<T: Encodable>(data: T, key: String, completion: @escaping (Result<T, Error>) -> Void) {
        guard let encodedData = try? JSONEncoder().encode(data) else { completion(.failure(DataNotFoundError())); return }
        UserDefaults.standard.set(encodedData, forKey: key)
        completion(.success(data))
    }
}
