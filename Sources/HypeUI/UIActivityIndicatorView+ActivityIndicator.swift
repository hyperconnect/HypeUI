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

// MARK: - UIActivityIndicatorView (ActivityIndicator)

public extension UIActivityIndicatorView {

    /// Sets the basic appearance of the activity indicator.
    /// - Parameter style: The basic appearance of the activity indicator.
    /// - Returns: Modified activity indicator view.
    func style(_ style: UIActivityIndicatorView.Style) -> Self {
        self.style = style
        return self
    }

    /// Sets the color of the activity indicator.
    /// - Parameter color: The color of the activity indicator.
    /// - Returns: Modified activity indicator view.
    func color(_ color: UIColor) -> Self {
        self.color = color
        return self
    }

    /// Sets whether the receiver is hidden when the animation stops.
    /// - Parameter hidesWhenStopped: A Boolean value that controls whether the activity indicator is hidden when the animation is stopped.
    /// - Returns: Modified activity indicator view.
    func hidesWhenStopped(_ hidesWhenStopped: Bool) -> Self {
        self.hidesWhenStopped = hidesWhenStopped
        return self
    }

    /// Sets the animating state of the activity indicator.
    /// - Parameter animating: When true, starts animating; when false, stops animating.
    /// - Returns: Modified activity indicator view.
    func animating(_ animating: Bool) -> Self {
        if animating {
            startAnimating()
        } else {
            stopAnimating()
        }
        return self
    }
}
