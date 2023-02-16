//
//  CatsURLRequestFactory.swift
//  URLSessionSample
//
//  Created by Victor Pacheco on 16/02/23.
//

import Foundation

public final class CatsURLRequestFactory: URLRequestFactory {
    
    private let hostName: String
    
    public init(hostName: String) {
        self.hostName = hostName
    }
    
    // TODO: Move logic to create a URL outside here. This should represent an Endpoint.
    public func makeUrlRequest() -> URLRequest {
        let url = URL(string: "\(hostName)/cats")!
        let request = URLRequest(url: url)
        return request
    }
}
