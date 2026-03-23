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

// MARK: - UISlider+SliderTests

@testable import HypeUI
final class UISliderSliderTests: XCLayoutTestCase {

    func testValue() {
        // given
        let sut = UISlider()

        // when
        let output = sut.value(0.5)

        // then
        XCTAssertEqual(sut.value, 0.5)
        XCTAssertEqual(sut, output)
    }

    func testMinimumValue() {
        // given
        let sut = UISlider()

        // when
        let output = sut.minimumValue(-10)

        // then
        XCTAssertEqual(sut.minimumValue, -10)
        XCTAssertEqual(sut, output)
    }

    func testMaximumValue() {
        // given
        let sut = UISlider()

        // when
        let output = sut.maximumValue(100)

        // then
        XCTAssertEqual(sut.maximumValue, 100)
        XCTAssertEqual(sut, output)
    }

    func testIsContinuous() {
        // given
        let sut = UISlider()

        // when
        let output = sut.isContinuous(false)

        // then
        XCTAssertFalse(sut.isContinuous)
        XCTAssertEqual(sut, output)
    }

    func testMinimumTrackTintColor() {
        // given
        let sut = UISlider()

        // when
        let output = sut.minimumTrackTintColor(.red)

        // then
        XCTAssertEqual(sut.minimumTrackTintColor, .red)
        XCTAssertEqual(sut, output)
    }

    func testMaximumTrackTintColor() {
        // given
        let sut = UISlider()

        // when
        let output = sut.maximumTrackTintColor(.blue)

        // then
        XCTAssertEqual(sut.maximumTrackTintColor, .blue)
        XCTAssertEqual(sut, output)
    }

    func testThumbTintColor() {
        // given
        let sut = UISlider()

        // when
        let output = sut.thumbTintColor(.green)

        // then
        XCTAssertEqual(sut.thumbTintColor, .green)
        XCTAssertEqual(sut, output)
    }

    func testOnChange() {
        // given
        let sut = UISlider()
        contentView.addSubview(sut)
        var receivedValue: Float?

        // when
        let output = sut.onChange { receivedValue = $0 }
        sut.value = 0.75
        sut.handleSliderValueChanged()

        // then
        XCTAssertEqual(receivedValue, 0.75)
        XCTAssertEqual(sut, output)
    }
}
