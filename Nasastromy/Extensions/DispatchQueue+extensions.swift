//
//  DispatchQueue+extensions.swift
//  Nasastromy
//
//  Created by Asep Hikmat Fatahillah on 14/05/24.
//

import Foundation

protocol DispatchQueueType {
    func async(execute work: @escaping @convention(block) () -> Void)
}

extension DispatchQueue: DispatchQueueType {
    func async(execute work: @escaping @convention(block) () -> Void) {
        async(group: nil, qos: .unspecified, flags: [], execute: work)
    }
}
