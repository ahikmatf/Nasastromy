//
//  FeedViewMock.swift
//  NasastromyTests
//
//  Created by Asep Hikmat Fatahillah on 14/05/24.
//

@testable import Nasastromy

final class FeedViewMock: FeedViewable {
    var reloadTableViewInvoked = false
    func reloadTableView() {
        reloadTableViewInvoked = true
    }
}
