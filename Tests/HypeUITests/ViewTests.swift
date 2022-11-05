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
import UIKit

// MARK: - ViewTests

@testable import HypeUI
final class ViewTests: XCLayoutTestCase {

    func testPaddingWithUIEdgeInsets() {
        // given
        let sut = HStack(spacing: 5) {
            Image()
                .frame(width: 20, height: 20)
            Text()
                .frame(width: 100, height: 20)
        }.padding(UIEdgeInsets(top: 10, left: 20, bottom: 10, right: 20))

        contentView.addSubviewWithFit(
            VStack(alignment: .center) {
                sut
                Spacer()
            }
        )
        contentView.layoutIfNeeded()

        // then
        XCTAssertEqual(sut.frame.size, CGSize(width: 20 + 125 + 20, height: 10 + 20 + 10))
        XCTAssertEqual(sut.frame.midX, sut.frame.midX)

        // https://github.com/SnapKit/SnapKit/blob/develop/Tests/SnapKitTests/Tests.swift#L95
        XCTAssertNotNil(sut.constraints.first { $0.firstAttribute == .leading && $0.secondAttribute == .leading })
        XCTAssertNotNil(sut.constraints.first { $0.firstAttribute == .trailing && $0.secondAttribute == .trailing })
        XCTAssertNotNil(sut.constraints.first { $0.firstAttribute == .top && $0.secondAttribute == .top })
        XCTAssertNotNil(sut.constraints.first { $0.firstAttribute == .bottom && $0.secondAttribute == .bottom })
    }

    func testPaddingWithEdges() {
        // given
        let sut = HStack(spacing: 5) {
            Image()
                .frame(width: 20, height: 20)
            Text()
                .frame(width: 100, height: 20)
        }.padding(.all, 20)

        contentView.addSubviewWithFit(
            VStack(alignment: .center) {
                sut
                Spacer()
            }
        )
        contentView.layoutIfNeeded()

        // then
        XCTAssertEqual(sut.frame.size, CGSize(width: 20 + 125 + 20, height: 20 + 20 + 20))
        XCTAssertEqual(sut.frame.midX, sut.frame.midX)

        // https://github.com/SnapKit/SnapKit/blob/develop/Tests/SnapKitTests/Tests.swift#L95
        XCTAssertNotNil(sut.constraints.first { $0.firstAttribute == .leading && $0.secondAttribute == .leading })
        XCTAssertNotNil(sut.constraints.first { $0.firstAttribute == .trailing && $0.secondAttribute == .trailing })
        XCTAssertNotNil(sut.constraints.first { $0.firstAttribute == .top && $0.secondAttribute == .top })
        XCTAssertNotNil(sut.constraints.first { $0.firstAttribute == .bottom && $0.secondAttribute == .bottom })
    }

    func testFrameWidth() {
        // given
        var sut = Spacer()

        // when
        sut = sut.frame(width: 10)

        // then
        XCTAssertNotNil(sut.constraints.first { $0.firstAttribute == .width && $0.constant == 10 })
        XCTAssertNil(sut.constraints.first { $0.firstAttribute == .height })
    }

    func testFrameHeight() {
        // given
        var sut = Spacer()

        // when
        sut = sut.frame(height: 10)

        // then
        XCTAssertNotNil(sut.constraints.first { $0.firstAttribute == .height && $0.constant == 10 })
        XCTAssertNil(sut.constraints.first { $0.firstAttribute == .width })
    }
}
