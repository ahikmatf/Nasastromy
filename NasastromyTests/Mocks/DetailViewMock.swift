//
//  DetailViewMock.swift
//  NasastromyTests
//
//  Created by Asep Hikmat Fatahillah on 14/05/24.
//

@testable import Nasastromy

final class DetailViewMock: DetailViewable {
    var updateInvoked = false
    var updateWith: AstroPod?
    func update(with data: AstroPod) {
        updateInvoked = true
        updateWith = data
    }
}
