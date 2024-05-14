//
//  ImageCacheTests.swift
//  NasastromyTests
//
//  Created by Asep Hikmat Fatahillah on 14/05/24.
//

@testable import Nasastromy
import XCTest

final class ImageCacheTests: XCTestCase {
    func test_storeImage_andLoad() {
        let key = "testing"
        let image = UIImage()
        ImageCache.store(key: key, data: image)
        
        if let loadedImage = ImageCache.load(key: key) as? UIImage {
            XCTAssertEqual(loadedImage, image)
        } else {
            fatalError("image is different")
        }
    }
}
