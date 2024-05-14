//
//  FeedPresenter.swift
//  Nasastromy
//
//  Created by Asep Hikmat Fatahillah on 13/05/24.
//

import Foundation

protocol FeedPresentable {
    var astroPods: [AstroPod] { get }
    
    func fetchAstroPod() async
    func feedCellModel(at index: Int) -> FeedCellModel
    func didSelectRow(at index: Int)
}

final class FeedPresenter: FeedPresentable {
    private let router: Routable
    private let feedService: FeedServiceable
    var view: FeedViewable?
    
    var astroPods = [AstroPod]()
    
    init(router: Routable, feedService: FeedServiceable) {
        self.router = router
        self.feedService = feedService
    }
    
    func fetchAstroPod() async {
        let result = await feedService.fetchAstroPod(startDate: Date.sevenDaysAgo, endDate: Date.today)
        switch result {
        case .success(let astropods):
            self.astroPods = astropods
        case .failure:
            self.router.showGenericErrorAlert()
        }
        
        view?.reloadTableView()
    }
    
    func feedCellModel(at index: Int) -> FeedCellModel {
        let astroPod = astroPods[index]
        return FeedCellModel(title: astroPod.title, imageUrl: astroPod.url, date: astroPod.date)
    }
    
    func didSelectRow(at index: Int) {
        router.showDetailViewController(data: astroPods[index])
    }
}
