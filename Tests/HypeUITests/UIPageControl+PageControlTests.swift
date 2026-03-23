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

// MARK: - UIPageControl+PageControlTests

@testable import HypeUI
final class UIPageControlPageControlTests: XCLayoutTestCase {

    func testCurrentPage() {
        // given
        let sut = UIPageControl()
        sut.numberOfPages = 5

        // when
        let output = sut.currentPage(2)

        // then
        XCTAssertEqual(sut.currentPage, 2)
        XCTAssertEqual(sut, output)
    }

    func testNumberOfPages() {
        // given
        let sut = UIPageControl()

        // when
        let output = sut.numberOfPages(10)

        // then
        XCTAssertEqual(sut.numberOfPages, 10)
        XCTAssertEqual(sut, output)
    }

    func testPageIndicatorTintColor() {
        // given
        let sut = UIPageControl()

        // when
        let output = sut.pageIndicatorTintColor(.gray)

        // then
        XCTAssertEqual(sut.pageIndicatorTintColor, .gray)
        XCTAssertEqual(sut, output)
    }

    func testCurrentPageIndicatorTintColor() {
        // given
        let sut = UIPageControl()

        // when
        let output = sut.currentPageIndicatorTintColor(.red)

        // then
        XCTAssertEqual(sut.currentPageIndicatorTintColor, .red)
        XCTAssertEqual(sut, output)
    }

    func testHidesForSinglePage() {
        // given
        let sut = UIPageControl()

        // when
        let output = sut.hidesForSinglePage(true)

        // then
        XCTAssertTrue(sut.hidesForSinglePage)
        XCTAssertEqual(sut, output)
    }

    func testOnChange() {
        // given
        let sut = UIPageControl()
        contentView.addSubview(sut)
        sut.numberOfPages = 5
        var receivedPage: Int?

        // when
        let output = sut.onChange { receivedPage = $0 }
        sut.currentPage = 3
        sut.handlePageControlValueChanged()

        // then
        XCTAssertEqual(receivedPage, 3)
        XCTAssertEqual(sut, output)
    }
}
