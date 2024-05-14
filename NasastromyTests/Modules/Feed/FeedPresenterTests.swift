//
//  FeedPresenterTests.swift
//  NasastromyTests
//
//  Created by Asep Hikmat Fatahillah on 14/05/24.
//

@testable import Nasastromy
import XCTest

class FeedPresenterTests: XCTestCase {
    var router: RouterMock!
    var feedService: FeedServiceMock!
    
    override func setUp() async throws {
        router = RouterMock()
        feedService = FeedServiceMock()
        try await super.setUp()
    }
    
    override func tearDown() async throws {
        router = nil
        feedService = nil
        try await super.tearDown()
    }
    
    func test_fetchAstroPods_returnThreeObjects_usingValidDate() async {
        let expectedCount = 3
        feedService.generateData(count: expectedCount)
        
        let sut = makeSUT()
        await sut.fetchAstroPod(startDate: "valid", endDate: "valid")
        
        XCTAssertEqual(sut.astroPods.count, expectedCount)
    }
    
    func test_fetchAstroPods_returnError_usingInvalidDate() async {
        let sut = makeSUT()
        await sut.fetchAstroPod(startDate: "invalid", endDate: "valid")
        
        XCTAssertTrue(router.showGenericErrorAlertInvoked)
    }
    
    func test_getFeedCellModel_forCertainIndex() async {
        let expectedCount = 3
        feedService.generateData(count: expectedCount)
        
        let sut = makeSUT()
        await sut.fetchAstroPod(startDate: "valid", endDate: "valid")
        guard let model = sut.nasaCellModel(at: 1) as? FeedCellModel else { fatalError("model is invalid") }
        
        XCTAssertEqual(model.title, sut.astroPods[1].title)
    }
    
    func test_didSelectRow_navigateToDetailView() async {
        let expectedCount = 3
        feedService.generateData(count: expectedCount)
        
        let sut = makeSUT()
        await sut.fetchAstroPod(startDate: "valid", endDate: "valid")
        sut.didSelectRow(at: 1)
        
        XCTAssertTrue(router.showDetailViewControllerInvoked)
        XCTAssertEqual(router.showDetailViewControllerData?.title, sut.astroPods[1].title)
    }
    
    private func makeSUT() -> FeedPresenter {
        let presenter = FeedPresenter(router: router, feedService: feedService)
        return presenter
    }
}
