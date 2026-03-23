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

// MARK: - UIStepper+StepperTests

@testable import HypeUI
final class UIStepperStepperTests: XCLayoutTestCase {

    func testValue() {
        // given
        let sut = UIStepper()

        // when
        let output = sut.value(5.0)

        // then
        XCTAssertEqual(sut.value, 5.0)
        XCTAssertEqual(sut, output)
    }

    func testMinimumValue() {
        // given
        let sut = UIStepper()

        // when
        let output = sut.minimumValue(-10)

        // then
        XCTAssertEqual(sut.minimumValue, -10)
        XCTAssertEqual(sut, output)
    }

    func testMaximumValue() {
        // given
        let sut = UIStepper()

        // when
        let output = sut.maximumValue(100)

        // then
        XCTAssertEqual(sut.maximumValue, 100)
        XCTAssertEqual(sut, output)
    }

    func testStepValue() {
        // given
        let sut = UIStepper()

        // when
        let output = sut.stepValue(0.5)

        // then
        XCTAssertEqual(sut.stepValue, 0.5)
        XCTAssertEqual(sut, output)
    }

    func testWraps() {
        // given
        let sut = UIStepper()

        // when
        let output = sut.wraps(true)

        // then
        XCTAssertTrue(sut.wraps)
        XCTAssertEqual(sut, output)
    }

    func testAutorepeat() {
        // given
        let sut = UIStepper()

        // when
        let output = sut.autorepeat(false)

        // then
        XCTAssertFalse(sut.autorepeat)
        XCTAssertEqual(sut, output)
    }

    func testIsContinuous() {
        // given
        let sut = UIStepper()

        // when
        let output = sut.isContinuous(false)

        // then
        XCTAssertFalse(sut.isContinuous)
        XCTAssertEqual(sut, output)
    }

    func testOnChange() {
        // given
        let sut = UIStepper()
        contentView.addSubview(sut)
        var receivedValue: Double?

        // when
        let output = sut.onChange { receivedValue = $0 }
        sut.value = 3.0
        sut.handleStepperValueChanged()

        // then
        XCTAssertEqual(receivedValue, 3.0)
        XCTAssertEqual(sut, output)
    }
}
