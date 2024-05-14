//
//  FeedServiceTests.swift
//  NasastromyTests
//
//  Created by Asep Hikmat Fatahillah on 14/05/24.
//

@testable import Nasastromy
import XCTest

final class FeedServiceTests: XCTestCase {
    override func setUp() async throws {
        try await super.setUp()
    }
    
    override func tearDown() async throws {
        URLProtocolMock.reset()
        try await super.tearDown()
    }
    
    func test_fetchAstroPod_successResponse() async {
        guard let url = Endpoint.apod(startDate: "valid", endDate: "valid").urlRequest.url else { fatalError("url is broken") }
        let response = HTTPURLResponse(url: url, statusCode: 200, httpVersion: nil, headerFields: ["Content-Type": "application/json"])!
        URLProtocolMock.mock(url: url, data: AstroPodMock.sample.data, response: response, error: nil)

        let config = URLSessionConfiguration.ephemeral
        config.protocolClasses = [URLProtocolMock.self]
        let urlSession = URLSession(configuration: config)

        let sut = FeedService(urlSession: urlSession)
        let result = await sut.fetchAstroPod(startDate: "valid", endDate: "valid")
        
        switch result {
        case .success(let astroPods):
            XCTAssertFalse(astroPods.isEmpty)
        case .failure:
            break
        }
    }
    
    func test_fetchAstroPod_failureResponse() async {
        guard let url = Endpoint.apod(startDate: "valid", endDate: "valid").urlRequest.url else { fatalError("url is broken") }
        let error = NSError(domain: "something went wrong", code: 404)
        URLProtocolMock.mock(url: url, data: nil, response: nil, error: error)

        let config = URLSessionConfiguration.ephemeral
        config.protocolClasses = [URLProtocolMock.self]
        let urlSession = URLSession(configuration: config)

        let sut = FeedService(urlSession: urlSession)
        let result = await sut.fetchAstroPod(startDate: "valid", endDate: "valid")
        
        switch result {
        case .success:
            break
        case .failure(let error):
            XCTAssertNotEqual(error.localizedDescription, "")
        }
    }
}
