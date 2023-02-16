//
//  URLRequestFactory.swift
//  URLSessionSample
//
//  Created by Victor Pacheco on 14/02/23.
//

import Foundation

protocol URLRequestFactory {
    func makeUrlRequest() -> URLRequest
}
