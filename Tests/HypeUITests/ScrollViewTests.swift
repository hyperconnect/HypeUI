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

// MARK: - ScrollViewTests

@testable import HypeUI
final class ScrollViewTests: XCLayoutTestCase {
    func testHorizontalScrollViewSmallContentSize() {
        // given
        let scrollView = ScrollView(.horizontal, showsIndicators: false) {
            HStack(alignment: .center, spacing: 20) {
                Text()
                    .frame(width: 100)
                Image()
                    .frame(width: 150)
            }
        }

        // when
        contentView.addSubviewWithFit(
            ZStack {
                scrollView
            }
        )
        contentView.layoutIfNeeded()

        // then
        XCTAssertEqual(scrollView.frame, contentView.frame)
        XCTAssertEqual(scrollView.contentSize, contentView.bounds.size)
    }

    func testHorizontalScrollViewLargeContentSize() {
        // given
        let scrollView = ScrollView(.horizontal, showsIndicators: false) {
            HStack(alignment: .center, spacing: 20) {
                Text()
                    .frame(width: 400)
                Image()
                    .frame(width: 650)
            }
        }

        // when
        contentView.addSubviewWithFit(
            ZStack {
                scrollView
            }
        )
        contentView.layoutIfNeeded()

        // then
        XCTAssertEqual(scrollView.contentSize.height, contentView.bounds.size.height)
        XCTAssertEqual(scrollView.frame, contentView.frame)
        XCTAssertGreaterThan(scrollView.contentSize.width, contentView.bounds.size.width)
    }


    func testVerticalScrollViewSmallContentSize() {
        // given
        let scrollView = ScrollView(.vertical, showsIndicators: false) {
            VStack(alignment: .center, spacing: 20) {
                Text()
                    .frame(height: 100)
                Image()
                    .frame(height: 150)
            }
        }

        // when
        contentView.addSubviewWithFit(
            ZStack {
                scrollView
            }
        )
        contentView.layoutIfNeeded()

        // then
        XCTAssertEqual(scrollView.frame, contentView.frame)
        XCTAssertEqual(scrollView.contentSize, contentView.bounds.size)
    }

    func testVerticalScrollViewLargeContentSize() {
        // given
        let scrollView = ScrollView(.vertical, showsIndicators: false) {
            VStack(alignment: .center, spacing: 20) {
                (1...5).map { _ in
                    HStack(alignment: .center) {
                        Text()
                            .frame(height: 100)
                        Image()
                            .frame(height: 200)
                    }
                }
            }
        }

        // when
        contentView.addSubviewWithFit(
            ZStack {
                scrollView
            }
        )
        contentView.layoutIfNeeded()

        // then
        XCTAssertEqual(scrollView.contentSize.width, contentView.bounds.size.width)
        XCTAssertEqual(scrollView.frame, contentView.frame)
        XCTAssertEqual(scrollView.contentSize.height, 200 * 5 + 20 * 4)
        XCTAssertGreaterThan(scrollView.contentSize.height, contentView.bounds.size.height)
    }
}
