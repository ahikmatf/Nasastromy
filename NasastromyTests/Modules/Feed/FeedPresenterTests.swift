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
    var view: FeedViewMock!
    
    override func setUp() async throws {
        router = RouterMock()
        feedService = FeedServiceMock()
        view = FeedViewMock()
        try await super.setUp()
    }
    
    override func tearDown() async throws {
        router = nil
        feedService = nil
        view = nil
        try await super.tearDown()
    }
    
    func test_fetchAstroPods_returnThreeObjects_usingValidDate() async {
        let expectedCount = 3
        feedService.generateData(count: expectedCount)
        
        let sut = makeSUT()
        await sut.fetchAstroPod(startDate: "valid", endDate: "valid")
        
        XCTAssertEqual(sut.astroPods.count, expectedCount)
        XCTAssertTrue(view.reloadTableViewInvoked)
    }
    
    func test_fetchAstroPods_returnError_usingInvalidDate() async {
        let sut = makeSUT()
        await sut.fetchAstroPod(startDate: "invalid", endDate: "valid")
        
        XCTAssertTrue(router.showGenericErrorAlertInvoked)
        XCTAssertTrue(view.reloadTableViewInvoked)
    }
    
    func test_getFeedCellModel_forCertainIndex() async {
        let expectedCount = 3
        feedService.generateData(count: expectedCount)
        
        let sut = makeSUT()
        await sut.fetchAstroPod(startDate: "valid", endDate: "valid")
        let model = sut.feedCellModel(at: 1)
        
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
        presenter.view = view
        return presenter
    }
}


//protocol FeedPresentable {
//    var astroPods: [AstroPod] { get }
//    
//    func fetchAstroPod(startDate: String, endDate: String) async
//    func feedCellModel(at index: Int) -> FeedCellModel
//    func didSelectRow(at index: Int)
//}
