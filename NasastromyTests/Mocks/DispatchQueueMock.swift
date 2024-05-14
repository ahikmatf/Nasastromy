//
//  DispatchQueueMock.swift
//  NasastromyTests
//
//  Created by Asep Hikmat Fatahillah on 14/05/24.
//

@testable import Nasastromy

final class DispatchQueueMock: DispatchQueueType {
    func async(execute work: @escaping @convention(block) () -> Void) {
        work()
    }
}
