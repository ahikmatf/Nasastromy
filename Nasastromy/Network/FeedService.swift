//
//  FeedService.swift
//  Nasastromy
//
//  Created by Asep Hikmat Fatahillah on 13/05/24.
//

import Foundation

protocol FeedServiceable {
    func fetchAstroPod(startDate: String, endDate: String) async -> [AstroPod]
}

final class FeedService: FeedServiceable {
    private let urlSession: URLSession
    
    init(urlSession: URLSession) {
        self.urlSession = urlSession
    }
    
    func fetchAstroPod(startDate: String, endDate: String) async -> [AstroPod] {
        let urlRequest = Endpoint.apod(startDate: startDate, endDate: endDate).urlRequest
        
        do {
            let (data, _) = try await urlSession.data(for: urlRequest)
            
            let decoder = JSONDecoder()
            decoder.keyDecodingStrategy = .convertFromSnakeCase
            let astropods = try decoder.decode([AstroPod].self, from: data)
            return astropods
        } catch {
            return []
        }
    }
}
