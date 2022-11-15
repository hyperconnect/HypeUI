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

// MARK: - LinearGradient  (ViewBuildable)

public struct LinearGradient: ViewBuildable {
    public let gradient: Gradient
    public let startPoint: UnitPoint
    public let endPoint: UnitPoint

    /// A linear gradient.
    /// - Parameters:
    ///   - gradient: A color gradient represented as an array of color stops, each having a parametric location value.
    ///   - startPoint: Start point of gradient.
    ///   - endPoint: End point of gradient.
    public init(gradient: Gradient, startPoint: UnitPoint, endPoint: UnitPoint) {
        self.gradient = gradient
        self.startPoint = startPoint
        self.endPoint = endPoint
    }

    public func build() -> UIView {
        GradientView(gradient: gradient)
            .startPoint(startPoint)
            .endPoint(endPoint)
    }
}
