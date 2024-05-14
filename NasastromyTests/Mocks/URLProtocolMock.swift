//
//  URLProtocolMock.swift
//  NasastromyTests
//
//  Created by Asep Hikmat Fatahillah on 14/05/24.
//

import Foundation

final class URLProtocolMock: URLProtocol {
    private static var mock: Mock?
    
    private struct Mock {
        let data: Data?
        let response: URLResponse?
        let error: Error?
    }
    
    static func mock(url: URL, data: Data?, response: URLResponse?, error: Error?) {
        mock = Mock(data: data, response: response, error: error)
    }
    
    static func reset() {
        mock = nil
    }
    
    override class func canInit(with request: URLRequest) -> Bool {
        return URLProtocolMock.mock != nil
    }
    
    override class func canonicalRequest(for request: URLRequest) -> URLRequest {
        return request
    }
    
    override func startLoading() {
        guard let mock = URLProtocolMock.mock else { return }
        
        if let data = mock.data {
            client?.urlProtocol(self, didLoad: data)
        }
        
        if let response = mock.response {
            client?.urlProtocol(self, didReceive: response, cacheStoragePolicy: .notAllowed)
        }
        
        if let error = mock.error {
            client?.urlProtocol(self, didFailWithError: error)
        }
        
        client?.urlProtocolDidFinishLoading(self)
    }
    
    override func stopLoading() {}
}
