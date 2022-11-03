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

// MARK: - HStackTests

@testable import HypeUI
final class HStackTests: XCTestCase {
    var contentView: UIView!

    override func setUpWithError() throws {
        let viewController = UIViewController()
        let window = UIWindow()
        window.addSubview(viewController.view)
        window.makeKeyAndVisible()
        contentView = UIView()
        viewController.view.addSubviewWithFit(contentView)
        RunLoop.current.run(until: Date())
    }

    func testHStackImageWithText() {
        // given
        let spacing: CGFloat = 5
        let image = Image()
        let text = Text("*****")
        let spacer = Spacer()

        // when
        let sut = HStack(alignment: .center, spacing: spacing) {
            image
                .frame(width: 24, height: 24)
            text
                .font(UIFont.systemFont(ofSize: 20, weight: .bold))
            spacer
        }
        contentView.addSubviewWithFit(sut)
        contentView.layoutIfNeeded()

        // then
        XCTAssertEqual(image.frame.width, 24)
        XCTAssertEqual(image.frame.height, 24)
        XCTAssertLessThan(image.frame.width, spacer.frame.width)
        XCTAssertLessThan(text.frame.width, spacer.frame.width)
    }

    func testHStackCenterAlignmentWithSpacing() {
        // given
        let spacing: CGFloat = 10
        let title = Text("Title")
            .font(UIFont.systemFont(ofSize: 10, weight: .bold))
        let spacer = Spacer()

        // when
        let sut = HStack(alignment: .center, spacing: spacing) {
            title
            spacer
        }
        contentView.addSubviewWithFit(sut)
        contentView.layoutIfNeeded()

        // then
        XCTAssertEqual(title.frame.maxX.rounded() + spacing, spacer.frame.minX.rounded())
        XCTAssertEqual(title.frame.midY, spacer.frame.midY)
        XCTAssertLessThan(title.frame.width, spacer.frame.width)
    }
}
