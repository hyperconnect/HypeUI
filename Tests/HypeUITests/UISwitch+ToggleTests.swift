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

// MARK: - UISwitch+ToggleTests

@testable import HypeUI
final class UISwitchToggleTests: XCLayoutTestCase {

    func testIsOn() {
        // given
        let sut = UISwitch()

        // when
        let output = sut.isOn(true)

        // then
        XCTAssertTrue(sut.isOn)
        XCTAssertEqual(sut, output)
    }

    func testIsOnFalse() {
        // given
        let sut = UISwitch()
        sut.isOn = true

        // when
        let output = sut.isOn(false)

        // then
        XCTAssertFalse(sut.isOn)
        XCTAssertEqual(sut, output)
    }

    func testOnTintColor() {
        // given
        let sut = UISwitch()

        // when
        let output = sut.onTintColor(.red)

        // then
        XCTAssertEqual(sut.onTintColor, .red)
        XCTAssertEqual(sut, output)
    }

    func testThumbTintColor() {
        // given
        let sut = UISwitch()

        // when
        let output = sut.thumbTintColor(.blue)

        // then
        XCTAssertEqual(sut.thumbTintColor, .blue)
        XCTAssertEqual(sut, output)
    }

    func testTintColor() {
        // given
        let sut = UISwitch()

        // when
        let output = sut.tintColor(.green)

        // then
        XCTAssertEqual(sut.tintColor, .green)
        XCTAssertEqual(sut, output)
    }

    func testOnChange() {
        // given
        let sut = UISwitch()
        contentView.addSubview(sut)
        var receivedValue: Bool?

        // when
        let output = sut.onChange { receivedValue = $0 }
        sut.isOn = true
        sut.handleSwitchValueChanged()

        // then
        XCTAssertTrue(receivedValue == true)
        XCTAssertEqual(sut, output)
    }
}
