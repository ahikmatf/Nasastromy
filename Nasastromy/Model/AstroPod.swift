//
//  AstroPod.swift
//  Nasastromy
//
//  Created by Asep Hikmat Fatahillah on 13/05/24.
//

import Foundation

struct AstroPod: Decodable {
    let date: String
    let explanation: String
    let mediaType: String
    let serviceVersion: String
    let title: String
    let url: String
}
