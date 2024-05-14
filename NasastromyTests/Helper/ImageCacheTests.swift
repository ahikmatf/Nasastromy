//
//  ImageCacheTests.swift
//  NasastromyTests
//
//  Created by Asep Hikmat Fatahillah on 14/05/24.
//

@testable import Nasastromy
import XCTest

final class ImageCacheTests: XCTestCase {
    var cache: ImageCache!
    
    override func setUp() async throws {
        cache = ImageCache()
        try await super.setUp()
    }
    
    override func tearDown() async throws {
        cache = nil
        try await super.tearDown()
    }
    
    func test_storeImage_andLoad() {
        let key: NSString = "testing"
        let image = UIImage()
        cache.store(key: key, data: image)
        
        if let loadedImage = cache.load(key: key) as? UIImage {
            XCTAssertEqual(loadedImage, image)
        } else {
            fatalError("image is different")
        }
    }
}
