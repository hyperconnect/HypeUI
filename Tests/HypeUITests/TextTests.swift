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

// MARK: - TextTests

@testable import HypeUI
final class TextTests: XCLayoutTestCase {

    func testOptionalNilTextModifyFont() {
        // Given
        let sut = Text(nil)

        // When
        let output = sut.font(UIFont.systemFont(ofSize: 12, weight: .regular))

        // Then
        XCTAssertNil(sut.text)
        XCTAssertEqual(sut, output)
    }

    func testNormalTextModifyFont() {
        // Given
        let title = "🔥 Hello HypeUI"
        let sut = Text(title)

        // When
        let output = sut.font(UIFont.systemFont(ofSize: 12, weight: .regular))

        // Then
        XCTAssertEqual(sut.text, title)
        XCTAssertEqual(sut, output)
    }
}
