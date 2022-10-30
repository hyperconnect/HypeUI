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

// MARK: - ViewArrayBuilderTests

@testable import HypeUI
final class ViewArrayBuilderTests: XCTestCase {
    func testViewArrayBuilder() {
        // given
        let label = UILabel()
        let button = UIButton()
        let image = UIImageView()
        let expect = [label, button, image]

        // when
        let output = ViewArrayBuilder.buildBlock(expect)

        // then
        XCTAssertEqual(output, expect)
    }

    func testViewArrayResultBuilder() {
        // given
        let label = UILabel()
        let button = UIButton()
        let image = UIImageView()
        let expect = [label, button, image]

        // when
        let output = ViewArrayBuilder.buildBlock(label, button, image)

        // then
        XCTAssertEqual(output, expect)
    }
}
