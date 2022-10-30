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

// MARK: - UIView_PassthroughTests

@testable import HypeUI
final class UIView_PassthroughTests: XCTestCase {
    enum Constant {
        static let defaultFrame = CGRect(origin: .zero, size: CGSize(width: 100, height: 100))
    }

    func testPassThroughView() {
        // given
        let sut = UIView(frame: Constant.defaultFrame)
        sut.isHidden = false

        // when
        let output = sut.passthrough(CGPoint(x: 10, y: 10), with: nil)

        // then
        XCTAssertNil(output)
    }

    func testPassThroughHiddenView() {
        // given
        let sut = UIView(frame: Constant.defaultFrame)
        sut.isHidden = true

        // when
        let output = sut.passthrough(CGPoint(x: 10, y: 10), with: nil)

        // then
        XCTAssertNil(output)
    }

    func testPassThroughViewWithSubView() {
        // given
        let sut = UIView(frame: Constant.defaultFrame)
        let target = UIView(frame: Constant.defaultFrame)
        sut.isHidden = false
        sut.addSubview(target)

        // when
        let output = sut.passthrough(CGPoint(x: 10, y: 10), with: nil)

        // then
        XCTAssertNotNil(output)
        XCTAssertEqual(output, target)
    }

    func testPassThroughHiddenViewWithSubview() {
        // given
        let sut = UIView(frame: Constant.defaultFrame)
        let target = UIView(frame: Constant.defaultFrame)
        sut.isHidden = true
        sut.addSubview(target)

        // when
        let output = sut.passthrough(CGPoint(x: 10, y: 10), with: nil)

        // then
        XCTAssertNil(output)
    }

    func testPassThroughUserInteractionEnabledViewWithSubview() {
        // given
        let sut = UIView(frame: Constant.defaultFrame)
        let target = UIView(frame: Constant.defaultFrame)
        sut.isHidden = false
        sut.isUserInteractionEnabled = true
        sut.addSubview(target)

        // when
        let output = sut.passthrough(CGPoint(x: 10, y: 10), with: nil)

        // then
        XCTAssertNotNil(output)
        XCTAssertEqual(output, target)
    }

    func testPassThroughUserInteractionDisabledViewWithSubview() {
        // given
        let sut = UIView(frame: Constant.defaultFrame)
        let target = UIView(frame: Constant.defaultFrame)
        sut.isHidden = false
        sut.isUserInteractionEnabled = false
        sut.addSubview(target)

        // when
        let output = sut.passthrough(CGPoint(x: 10, y: 10), with: nil)

        // then
        XCTAssertNil(output)
    }
}
