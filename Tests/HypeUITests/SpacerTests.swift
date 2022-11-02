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

// MARK: - SpacerTests

@testable import HypeUI
final class SpacerTests: XCTestCase {

    func testSpacerUILayoutPriority() {
        let sut = Spacer()

        testPriority(sut: sut, target: UIView())
        testPriority(sut: sut, target: UILabel())
        testPriority(sut: sut, target: UIButton())
        testPriority(sut: sut, target: UITextView())
        testPriority(sut: sut, target: UITextField())
        testPriority(sut: sut, target: UIStackView())
        testPriority(sut: sut, target: PassthroughView())
        testPriority(sut: sut, target: PassthroughStackView())
    }

    private func testPriority(sut: UIView, target: UIView) {
        XCTAssertLessThan(sut.contentHuggingPriority(for: .vertical), target.contentHuggingPriority(for: .vertical))
        XCTAssertLessThan(sut.contentHuggingPriority(for: .horizontal), target.contentHuggingPriority(for: .horizontal))
        XCTAssertLessThan(sut.contentCompressionResistancePriority(for: .vertical), target.contentCompressionResistancePriority(for: .vertical))
        XCTAssertLessThan(sut.contentCompressionResistancePriority(for: .horizontal), target.contentCompressionResistancePriority(for: .horizontal))
    }
}


