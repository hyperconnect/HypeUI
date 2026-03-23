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

// MARK: - UIPageControl (PageControl)

private var uiPageControlOnChangeKey: UInt8 = 0

public extension UIPageControl {

    private var onChangeAction: ((Int) -> Void)? {
        get { objc_getAssociatedObject(self, &uiPageControlOnChangeKey) as? (Int) -> Void }
        set { objc_setAssociatedObject(self, &uiPageControlOnChangeKey, newValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC) }
    }

    /// Sets the current page displayed by the page control.
    /// - Parameter page: The current page, whose indicator is displayed as white dot.
    /// - Returns: Modified page control.
    func currentPage(_ page: Int) -> Self {
        currentPage = page
        return self
    }

    /// Sets the number of pages the page control shows.
    /// - Parameter count: The number of pages the receiver shows.
    /// - Returns: Modified page control.
    func numberOfPages(_ count: Int) -> Self {
        numberOfPages = count
        return self
    }

    /// Sets the tint color to apply to the page indicator.
    /// - Parameter color: The tint color to apply to the page indicator.
    /// - Returns: Modified page control.
    func pageIndicatorTintColor(_ color: UIColor?) -> Self {
        pageIndicatorTintColor = color
        return self
    }

    /// Sets the tint color to apply to the current page indicator.
    /// - Parameter color: The tint color to apply to the current page indicator.
    /// - Returns: Modified page control.
    func currentPageIndicatorTintColor(_ color: UIColor?) -> Self {
        currentPageIndicatorTintColor = color
        return self
    }

    /// Sets whether the page control is hidden when there is only one page.
    /// - Parameter hidesForSinglePage: A Boolean value that controls whether the page control is hidden when there is only one page.
    /// - Returns: Modified page control.
    func hidesForSinglePage(_ hidesForSinglePage: Bool) -> Self {
        self.hidesForSinglePage = hidesForSinglePage
        return self
    }

    /// Adds an action to perform when the current page changes.
    /// - Parameter action: A closure that receives the new current page index.
    /// - Returns: Modified page control.
    func onChange(_ action: @escaping (Int) -> Void) -> Self {
        onChangeAction = action
        removeTarget(self, action: #selector(handlePageControlValueChanged), for: .valueChanged)
        addTarget(self, action: #selector(handlePageControlValueChanged), for: .valueChanged)
        return self
    }

    @objc internal func handlePageControlValueChanged() {
        onChangeAction?(currentPage)
    }
}
