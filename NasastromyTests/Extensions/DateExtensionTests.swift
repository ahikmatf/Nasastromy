//
//  DateExtensionTests.swift
//  NasastromyTests
//
//  Created by Asep Hikmat Fatahillah on 14/05/24.
//

@testable import Nasastromy
import XCTest

final class DateExtensionTests: XCTestCase {
    func test_todaysDate_inCertainDateStringFormat() {
        let df = createDateFormatter()
        let today = Date()
        
        XCTAssertEqual(Date.today, df.string(from: today))
    }
    
    func test_sevenDaysAgoDate_inCertainDateStringFormat() {
        let df = createDateFormatter()
        let today = Date()
        let sevenDaysAgo = Calendar.current.date(byAdding: .day, value: -6, to: today)!
        
        XCTAssertEqual(Date.sevenDaysAgo, df.string(from: sevenDaysAgo))
    }
    
    private func createDateFormatter() -> DateFormatter {
        let df = DateFormatter()
        df.dateFormat = .localizedStringWithFormat("yyyy-MM-dd")
        df.timeZone = TimeZone(abbreviation: "GMT")
        return df
    }
}
