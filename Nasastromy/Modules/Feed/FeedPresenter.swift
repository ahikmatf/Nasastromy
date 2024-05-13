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
        let result = await feedService.fetchAstroPod(startDate: Date.today, endDate: Date.sevenDaysAgo)
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
}

private extension Date {
    static var today: String {
        let df = DateFormatter()
        df.dateFormat = .localizedStringWithFormat("yyyy-MM-dd")
        df.timeZone = TimeZone(abbreviation: "GMT")
        
        let today = Date()
        return df.string(from: today)
    }
    
    static var sevenDaysAgo: String {
        let df = DateFormatter()
        df.dateFormat = .localizedStringWithFormat("yyyy-MM-dd")
        df.timeZone = TimeZone(abbreviation: "GMT")
        
        let today = Date()
        let sevenDaysAgo = Calendar.current.date(byAdding: .day, value: -6, to: today)!
        return df.string(from: sevenDaysAgo)
    }
}
