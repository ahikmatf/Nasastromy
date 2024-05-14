//
//  Date+extensions.swift
//  Nasastromy
//
//  Created by Asep Hikmat Fatahillah on 14/05/24.
//

import Foundation

extension Date {
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
