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

// MARK: - UIProgressView+ProgressViewTests

@testable import HypeUI
final class UIProgressViewProgressViewTests: XCLayoutTestCase {

    func testProgress() {
        // given
        let sut = UIProgressView()

        // when
        let output = sut.progress(0.6)

        // then
        XCTAssertEqual(sut.progress, 0.6, accuracy: 0.001)
        XCTAssertEqual(sut, output)
    }

    func testProgressTintColor() {
        // given
        let sut = UIProgressView()

        // when
        let output = sut.progressTintColor(.red)

        // then
        XCTAssertEqual(sut.progressTintColor, .red)
        XCTAssertEqual(sut, output)
    }

    func testTrackTintColor() {
        // given
        let sut = UIProgressView()

        // when
        let output = sut.trackTintColor(.gray)

        // then
        XCTAssertEqual(sut.trackTintColor, .gray)
        XCTAssertEqual(sut, output)
    }

    func testProgressViewStyle() {
        // given
        let sut = UIProgressView()

        // when
        let output = sut.progressViewStyle(.bar)

        // then
        XCTAssertEqual(sut.progressViewStyle, .bar)
        XCTAssertEqual(sut, output)
    }
}
