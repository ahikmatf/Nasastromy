//
//  DetailPresenterTest.swift
//  NasastromyTests
//
//  Created by Asep Hikmat Fatahillah on 14/05/24.
//

@testable import Nasastromy
import XCTest

final class DetailPresenterTest: XCTestCase {
    var view: DetailViewMock!
    var service: FeedServiceMock!
    
    override func setUp() async throws {
        view = DetailViewMock()
        service = FeedServiceMock()
        try await super.setUp()
    }
    
    override func tearDown() async throws {
        view = nil
        service = nil
        try await super.tearDown()
    }
    
    func test_getDetailData() {
        service.generateData(count: 1)
        let generatedData = service.astroPods[0]
        let sut = DetailPresenter(detailData: generatedData)
        
        let detailData = sut.getDetailData()
        
        XCTAssertEqual(detailData.title, generatedData.title)
    }
}
