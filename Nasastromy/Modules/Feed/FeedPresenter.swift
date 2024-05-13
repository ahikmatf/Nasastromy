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
        astroPods = await feedService.fetchAstroPod(startDate: Date.sevenDaysAgo, endDate: Date.today)
        print(astroPods.count)
    }
}

private extension Date {
    static var today: String {
        let df = DateFormatter()
        df.dateFormat = .localizedStringWithFormat("yyyy-MM-dd")
        
        let today = Date()
        return df.string(from: today)
    }
    
    static var sevenDaysAgo: String {
        let df = DateFormatter()
        df.dateFormat = .localizedStringWithFormat("yyyy-MM-dd")
        
        let today = Date()
        let sevenDaysAgo = Calendar.current.date(byAdding: .day, value: -6, to: today)!
        return df.string(from: sevenDaysAgo)
    }
}
