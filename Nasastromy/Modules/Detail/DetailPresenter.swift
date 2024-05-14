//
//  DetailPresenter.swift
//  Nasastromy
//
//  Created by Asep Hikmat Fatahillah on 14/05/24.
//

import Foundation

protocol DetailPresentable {
    func getDetailData() -> AstroPod
}

final class DetailPresenter: DetailPresentable {
    private let detailData: AstroPod
    var view: DetailViewable?
    
    init(detailData: AstroPod) {
        self.detailData = detailData
    }
    
    func getDetailData() -> AstroPod {
        return detailData
    }
}
