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

import UIKit

// MARK: - ViewArrayBuilder

@resultBuilder
public struct ViewArrayBuilder {

    /// Build a views from variadic child views
    /// - Parameter views: An variadic child views
    /// - Returns: An array of views that are composed of variadic child views
    public static func buildBlock(_ views: UIView...) -> [UIView] {
        views
    }


    /// Build a views from array of views
    /// - Parameter views: An array of views
    /// - Returns: An array of views
    public static func buildBlock(_ views: [UIView]) -> [UIView] {
        views
    }
}
