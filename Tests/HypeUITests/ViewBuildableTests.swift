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

// MARK: - ViewBuildableTests

@testable import HypeUI
final class ViewBuildableTests: XCLayoutTestCase {

    func testHStackWithViewBuildable() {
        struct ProfileView: ViewBuildable {
            @Behavior var country: String
            @Behavior var name: String

            func build() -> UIView {
                VStack {
                    HStack(alignment: .center, spacing: 12) {
                        Text("")
                            .linked($country, keyPath: \.text)
                            .font(UIFont.systemFont(ofSize: 20, weight: .regular))
                            .accessibilityIdentifier("country")
                        Text("")
                            .linked($name, keyPath: \.text)
                            .font(UIFont.systemFont(ofSize: 20, weight: .regular))
                            .accessibilityIdentifier("name")
                    }
                }
            }
        }

        // Given

        let sut = ProfileView(country: "🇪🇸", name: "Español")

        // When

        contentView.addSubviewWithFit(
            VStack {
                HStack {
                    sut
                    Spacer()
                }.build().build().build()
            }
        )

        // Then

        let countryText = contentView.findView(identifier: "country") as? Text
        let nameText = contentView.findView(identifier: "name") as? Text
        XCTAssertEqual(countryText?.text, "🇪🇸")
        XCTAssertEqual(nameText?.text, "Español")
    }
}
