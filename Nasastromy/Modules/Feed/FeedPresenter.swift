//
//  FeedPresenter.swift
//  Nasastromy
//
//  Created by Asep Hikmat Fatahillah on 13/05/24.
//

import Foundation

protocol FeedPresentable {
    var astroPods: [AstroPod] { get }
    
    func fetchAstroPod(startDate: String, endDate: String) async
    func nasaCellModel(at index: Int) -> NasaCellModel
    func didSelectRow(at index: Int)
}

final class FeedPresenter: FeedPresentable {
    private let router: Routable
    private let feedService: FeedServiceable
    
    var astroPods = [AstroPod]()
    
    init(router: Routable, feedService: FeedServiceable) {
        self.router = router
        self.feedService = feedService
    }
    
    func fetchAstroPod(startDate: String, endDate: String) async {
        let result = await feedService.fetchAstroPod(startDate: startDate, endDate: endDate)
        switch result {
        case .success(let astroPods):
            self.astroPods = astroPods
        case .failure:
            self.router.showGenericErrorAlert()
        }
    }
    
    func nasaCellModel(at index: Int) -> NasaCellModel {
        let astroPod = astroPods[index]
        return FeedCellModel(title: astroPod.title, imageUrl: astroPod.url, date: astroPod.date)
    }
    
    func didSelectRow(at index: Int) {
        router.showDetailViewController(data: astroPods[index])
    }
}
