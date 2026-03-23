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

// MARK: - UIActivityIndicatorView+ActivityIndicatorTests

@testable import HypeUI
final class UIActivityIndicatorViewActivityIndicatorTests: XCLayoutTestCase {

    func testStyle() {
        // given
        let sut = UIActivityIndicatorView()

        // when
        let output = sut.style(.large)

        // then
        XCTAssertEqual(sut.style, .large)
        XCTAssertEqual(sut, output)
    }

    func testColor() {
        // given
        let sut = UIActivityIndicatorView()

        // when
        let output = sut.color(.red)

        // then
        XCTAssertEqual(sut.color, .red)
        XCTAssertEqual(sut, output)
    }

    func testHidesWhenStopped() {
        // given
        let sut = UIActivityIndicatorView()
        sut.hidesWhenStopped = true

        // when
        let output = sut.hidesWhenStopped(false)

        // then
        XCTAssertFalse(sut.hidesWhenStopped)
        XCTAssertEqual(sut, output)
    }

    func testAnimatingTrue() {
        // given
        let sut = UIActivityIndicatorView()

        // when
        let output = sut.animating(true)

        // then
        XCTAssertTrue(sut.isAnimating)
        XCTAssertEqual(sut, output)
    }

    func testAnimatingFalse() {
        // given
        let sut = UIActivityIndicatorView()
        sut.startAnimating()

        // when
        let output = sut.animating(false)

        // then
        XCTAssertFalse(sut.isAnimating)
        XCTAssertEqual(sut, output)
    }
}
