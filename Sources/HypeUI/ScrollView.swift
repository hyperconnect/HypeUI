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

// MARK: ScrollView

public extension UIScrollView {
    /// Modify scroll view bounces.
    /// - Parameter bounces: A Boolean value that controls whether the scroll view bounces past the edge of content and back again.
    /// - Returns: Modified scroll view.
    func bounces(_ bounces: Bool) -> Self {
        self.bounces = bounces
        return self
    }

    /// Modify scroll view paging enabled.
    /// - Parameter isPagingEnabled: A Boolean value that determines whether paging is enabled for the scroll view.
    /// - Returns: Modified scroll view.
    func isPagingEnabled(_ isPagingEnabled: Bool) -> Self {
        self.isPagingEnabled = isPagingEnabled
        return self
    }

    /// Modify scroll view enabled.
    /// - Parameter isScrollEnabled: A Boolean value that determines whether scrolling is enabled.
    /// - Returns: Modified scroll view.
    func isScrollEnabled(_ isScrollEnabled: Bool) -> Self {
        self.isScrollEnabled = isScrollEnabled
        return self
    }

    /// Sets the custom distance that the content view is inset from the safe area or scroll view edges.
    /// - Parameter insets: The custom distance that the content view is inset from the safe area or scroll view edges.
    /// - Returns: Modified scroll view.
    func contentInset(_ insets: UIEdgeInsets) -> Self {
        contentInset = insets
        return self
    }

    /// Sets the distance the scroll indicators are inset from the edge of the scroll view.
    /// - Parameter insets: The distance the scroll indicators are inset from the edge of the scroll view.
    /// - Returns: Modified scroll view.
    func scrollIndicatorInsets(_ insets: UIEdgeInsets) -> Self {
        self.scrollIndicatorInsets = insets
        return self
    }

    /// Sets whether the scroll view always scrolls vertically, regardless of content size.
    /// - Parameter value: A Boolean value that determines whether bouncing always occurs when vertical scrolling reaches the end of the content.
    /// - Returns: Modified scroll view.
    func alwaysBounceVertical(_ value: Bool) -> Self {
        alwaysBounceVertical = value
        return self
    }

    /// Sets whether the scroll view always scrolls horizontally, regardless of content size.
    /// - Parameter value: A Boolean value that determines whether bouncing always occurs when horizontal scrolling reaches the end of the content.
    /// - Returns: Modified scroll view.
    func alwaysBounceHorizontal(_ value: Bool) -> Self {
        alwaysBounceHorizontal = value
        return self
    }

    /// Sets the rate at which the scroll view decelerates to a stop after the user lifts their finger.
    /// - Parameter rate: The rate at which the scroll view decelerates to a stop.
    /// - Returns: Modified scroll view.
    func decelerationRate(_ rate: UIScrollView.DecelerationRate) -> Self {
        decelerationRate = rate
        return self
    }

    /// Sets whether the scroll view shows the vertical scroll indicator.
    /// - Parameter value: A Boolean value that controls whether the vertical scroll indicator is visible.
    /// - Returns: Modified scroll view.
    func showsVerticalScrollIndicator(_ value: Bool) -> Self {
        showsVerticalScrollIndicator = value
        return self
    }

    /// Sets whether the scroll view shows the horizontal scroll indicator.
    /// - Parameter value: A Boolean value that controls whether the horizontal scroll indicator is visible.
    /// - Returns: Modified scroll view.
    func showsHorizontalScrollIndicator(_ value: Bool) -> Self {
        showsHorizontalScrollIndicator = value
        return self
    }

    /// Sets the offset of the content origin from the scroll view origin.
    /// - Parameters:
    ///   - offset: A point that represents the content offset.
    ///   - animated: Whether to animate the transition.
    /// - Returns: Modified scroll view.
    func contentOffset(_ offset: CGPoint, animated: Bool = false) -> Self {
        setContentOffset(offset, animated: animated)
        return self
    }
}
