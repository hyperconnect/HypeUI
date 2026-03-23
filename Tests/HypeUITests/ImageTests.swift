//
//  Copyright 2022 Hyperconnect Inc.
//
//  Licensed under the Apache License, Version 2.0 (the "License");
//  you may not use this file except in compliance with the License.
//  You may obtain a copy of the License at
//
//      https://www.apache.org/licenses/LICENSE-2.0
//
//  Unless required by applicable law or agreed to in writing, software
//  distributed under the License is distributed on an "AS IS" BASIS,
//  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
//  See the License for the specific language governing permissions and
//  limitations under the License.
//

import XCTest

// MARK: - ImageTests

@testable import HypeUI
final class ImageTests: XCLayoutTestCase {

    func testHighlightedImage() {
        // given
        let sut = Image()
        let highlighted = UIImage()

        // when
        let output = sut.highlightedImage(highlighted)

        // then
        XCTAssertEqual(sut.highlightedImage, highlighted)
        XCTAssertEqual(sut, output)
    }

    func testIsHighlighted() {
        // given
        let sut = Image()

        // when
        let output = sut.isHighlighted(true)

        // then
        XCTAssertTrue(sut.isHighlighted)
        XCTAssertEqual(sut, output)
    }

    func testAnimationImages() {
        // given
        let sut = Image()
        let frames = [UIImage(), UIImage(), UIImage()]

        // when
        let output = sut.animationImages(frames, duration: 1.0)

        // then
        XCTAssertEqual(sut.animationImages?.count, 3)
        XCTAssertEqual(sut.animationDuration, 1.0)
        XCTAssertEqual(sut, output)
    }

    func testSymbolConfiguration() {
        guard #available(iOS 13.0, *) else { return }

        // given
        let sut = Image()
        let config = UIImage.SymbolConfiguration(pointSize: 24, weight: .bold)

        // when
        let output = sut.symbolConfiguration(config)

        // then
        XCTAssertNotNil(sut.preferredSymbolConfiguration)
        XCTAssertEqual(sut, output)
    }
}
