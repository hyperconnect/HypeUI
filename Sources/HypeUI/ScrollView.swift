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

// MARK: - Axis

public enum Axis {
    case vertical
    case horizontal
}

// MARK: - ScrollView

// swiftlint:disable identifier_name

/// A scrollable view.
/// - Parameters:
///   - axis: The scrollable axes of the scroll view.
///   - showsIndicators: A value that indicates whether the scroll view displays the scrollable component of the content offset, in a way that’s suitable for the platform.
///   - content: The  buildable content and behavior of the scroll view.
/// - Returns: A scrollable view.
public func ScrollView(_ axis: Axis, showsIndicators: Bool = true, content: () -> ViewBuildable) -> UIScrollView {
    let scrollView = UIScrollView()
    scrollView.showsVerticalScrollIndicator = showsIndicators
    scrollView.showsHorizontalScrollIndicator = showsIndicators

    let contentView = content().build()
    scrollView.addSubview(contentView)
    contentView.snp.makeConstraints { maker in
        maker.directionalEdges.equalToSuperview()
        switch axis {
        case .horizontal:
            maker.height.equalToSuperview()
            maker.width.equalToSuperview().priority(.low)
            maker.width.greaterThanOrEqualToSuperview()
        case .vertical:
            maker.width.equalToSuperview()
            maker.height.equalToSuperview().priority(.low)
            maker.height.greaterThanOrEqualToSuperview()
        }
    }
    return scrollView
}
// swiftlint:enable identifier_name
