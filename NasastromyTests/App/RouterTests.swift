//
//  RouterTests.swift
//  NasastromyTests
//
//  Created by Asep Hikmat Fatahillah on 14/05/24.
//

@testable import Nasastromy
import XCTest

final class RouterTests: XCTestCase {
    var navigationController: NavigationControllerMock!
    var dispatchQueueMock: DispatchQueueMock!
    var service: FeedServiceMock!
    
    override func setUp() async throws {
        navigationController = await NavigationControllerMock()
        dispatchQueueMock = DispatchQueueMock()
        service = FeedServiceMock()
        try await super.setUp()
    }
    
    override func tearDown() async throws {
        navigationController = nil
        dispatchQueueMock = nil
        service = nil
        try await super.tearDown()
    }
    
    func test_showRootVC_returnNavCwithFeedC() {
        let sut = makeSUT()
        let navC = sut.showRootViewController()
        
        XCTAssertTrue(navigationController.setViewControllersInvoked)
        XCTAssertTrue(navigationController.setViewControllersVC.first is FeedViewController)
    }
    
    func test_invokeError_navCPresentingAlert() {
        let sut = makeSUT()
        sut.showGenericErrorAlert()
        
        XCTAssertTrue(navigationController.presentInvoked)
        XCTAssertTrue(navigationController.presentedVC is UIAlertController)
    }
    
    func test_showDetailVC_usingCertainData() {
        service.generateData(count: 1)
        let data = service.astroPods[0]
        
        let sut = makeSUT()
        sut.showDetailViewController(data: data)
        
        XCTAssertTrue(navigationController.pushViewControllerInvoked)
        XCTAssertTrue(navigationController.pushViewControllerVC is DetailViewController)
    }
    
    private func makeSUT() -> Router {
        let router = Router(navigationController: navigationController, mainDispatchQueue: dispatchQueueMock)
        return router
    }
}
