//
//  Dog.swift
//  URLSessionSample
//
//  Created by Victor Pacheco on 14/02/23.
//

// TODO: Use CodingKeys or KeyDecodingStrategy to follow Swift naming conventions.
struct Dog: Decodable {
    let id: String
    let breed: String
    let short_description: String
    let size_info: String
}
