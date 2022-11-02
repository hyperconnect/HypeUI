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

/// A view that arranges its subviews in a vertical line.
/// - Parameters:
///   - alignment: The layout of arranged views perpendicular to the stack view’s axis.
///   - spacing: The distance in points between the adjacent edges of the stack view’s arranged views.
///   - content: Build a views from variadic child views
/// - Returns: vertical stack view
public func VStack(alignment: UIStackView.Alignment = .fill, spacing: CGFloat = 0.0, @ViewArrayBuilder _ content: () -> [UIView]) -> UIStackView {
    let stackView = PassthroughStackView(arrangedSubviews: content())
    stackView.axis = .vertical
    stackView.alignment = alignment
    stackView.spacing = spacing
    return stackView
}
