//
//  Endpoint.swift
//  Nasastromy
//
//  Created by Asep Hikmat Fatahillah on 13/05/24.
//

import Foundation

enum Endpoint {
    case apod(startDate: String, endDate: String)
    
    private var urlString: String {
        switch self {
        case .apod(let startDate, let endDate):
            return "https://api.nasa.gov/planetary/apod?api_key=DEMO_KEY&start_date=\(startDate)&end_date=\(endDate)"
        }
    }
    
    var urlRequest: URLRequest {
        let url = URL(string: urlString)!
        return URLRequest(url: url)
    }
}
