//
//  Cat.swift
//  URLSessionSample
//
//  Created by Victor Pacheco on 14/02/23.
//

struct Cat: Codable {
    let identifier: String
    let breed: String
    let size: Size
}

struct Size: Codable {
    let heightInCentimeters: Int
    let weightInKilograms: Int
    let description: String
}
