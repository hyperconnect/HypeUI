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

// MARK: - XCLayoutTestCase

@testable import HypeUI
class XCLayoutTestCase: XCTestCase {
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
}
