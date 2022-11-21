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

// MARK: - AlignmentTests

@testable import HypeUI
final class AlignmentTests: XCTestCase {

    func testTopLeadingAlignment() {
        let sut = Alignment.topLeading

        XCTAssertTrue(sut.isTop)
        XCTAssertTrue(sut.isLeading)

        XCTAssertFalse(sut.isBottom)
        XCTAssertFalse(sut.isTrailing)

        XCTAssertEqual(sut.horizontalAlignment, .top)
        XCTAssertEqual(sut.verticalAlignment, .leading)
    }

    func testTopAlignment() {
        let sut = Alignment.top

        XCTAssertTrue(sut.isTop)
        XCTAssertFalse(sut.isLeading)

        XCTAssertFalse(sut.isBottom)
        XCTAssertFalse(sut.isTrailing)

        XCTAssertEqual(sut.horizontalAlignment, .top)
        XCTAssertEqual(sut.verticalAlignment, .center)
    }

    func testTopTrailingAlignment() {
        let sut = Alignment.topTrailing

        XCTAssertTrue(sut.isTop)
        XCTAssertFalse(sut.isLeading)

        XCTAssertFalse(sut.isBottom)
        XCTAssertTrue(sut.isTrailing)

        XCTAssertEqual(sut.horizontalAlignment, .top)
        XCTAssertEqual(sut.verticalAlignment, .trailing)
    }

    func testLeadingAlignment() {
        let sut = Alignment.leading

        XCTAssertFalse(sut.isTop)
        XCTAssertTrue(sut.isLeading)

        XCTAssertFalse(sut.isBottom)
        XCTAssertFalse(sut.isTrailing)

        XCTAssertEqual(sut.horizontalAlignment, .center)
        XCTAssertEqual(sut.verticalAlignment, .leading)
    }

    func testCenterAlignment() {
        let sut = Alignment.center

        XCTAssertFalse(sut.isTop)
        XCTAssertFalse(sut.isLeading)

        XCTAssertFalse(sut.isBottom)
        XCTAssertFalse(sut.isTrailing)

        XCTAssertEqual(sut.horizontalAlignment, .center)
        XCTAssertEqual(sut.verticalAlignment, .center)
    }

    func testTrailingAlignment() {
        let sut = Alignment.trailing

        XCTAssertFalse(sut.isTop)
        XCTAssertFalse(sut.isLeading)

        XCTAssertFalse(sut.isBottom)
        XCTAssertTrue(sut.isTrailing)

        XCTAssertEqual(sut.horizontalAlignment, .center)
        XCTAssertEqual(sut.verticalAlignment, .trailing)
    }

    func testBottomLeadingAlignment() {
        let sut = Alignment.bottomLeading

        XCTAssertFalse(sut.isTop)
        XCTAssertTrue(sut.isLeading)

        XCTAssertTrue(sut.isBottom)
        XCTAssertFalse(sut.isTrailing)

        XCTAssertEqual(sut.horizontalAlignment, .bottom)
        XCTAssertEqual(sut.verticalAlignment, .leading)
    }

    func testBottomAlignment() {
        let sut = Alignment.bottom

        XCTAssertFalse(sut.isTop)
        XCTAssertFalse(sut.isLeading)

        XCTAssertTrue(sut.isBottom)
        XCTAssertFalse(sut.isTrailing)

        XCTAssertEqual(sut.horizontalAlignment, .bottom)
        XCTAssertEqual(sut.verticalAlignment, .center)
    }

    func testBottomTrailingAlignment() {
        let sut = Alignment.bottomTrailing

        XCTAssertFalse(sut.isTop)
        XCTAssertFalse(sut.isLeading)

        XCTAssertTrue(sut.isBottom)
        XCTAssertTrue(sut.isTrailing)

        XCTAssertEqual(sut.horizontalAlignment, .bottom)
        XCTAssertEqual(sut.verticalAlignment, .trailing)
    }
}
