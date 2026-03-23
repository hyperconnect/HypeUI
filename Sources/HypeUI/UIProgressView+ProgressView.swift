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

// MARK: - UIProgressView (ProgressView)

public extension UIProgressView {

    /// Sets the current progress of the progress view.
    /// - Parameters:
    ///   - progress: The current progress, between 0.0 and 1.0.
    ///   - animated: Specifies whether to animate the transition, default is false.
    /// - Returns: Modified progress view.
    func progress(_ progress: Float, animated: Bool = false) -> Self {
        setProgress(progress, animated: animated)
        return self
    }

    /// Sets the color shown for the portion of the progress bar that is filled.
    /// - Parameter color: The color shown for the portion of the progress bar that is filled.
    /// - Returns: Modified progress view.
    func progressTintColor(_ color: UIColor?) -> Self {
        progressTintColor = color
        return self
    }

    /// Sets the color shown for the portion of the progress bar that is not filled.
    /// - Parameter color: The color shown for the portion of the progress bar that is not filled.
    /// - Returns: Modified progress view.
    func trackTintColor(_ color: UIColor?) -> Self {
        trackTintColor = color
        return self
    }

    /// Sets the current graphical style of the progress view.
    /// - Parameter style: The current graphical style of the receiver.
    /// - Returns: Modified progress view.
    func progressViewStyle(_ style: UIProgressView.Style) -> Self {
        progressViewStyle = style
        return self
    }

    /// Sets the image to use for the progress portion of the progress bar.
    /// - Parameter image: The image to use for the progress portion of the progress bar.
    /// - Returns: Modified progress view.
    func progressImage(_ image: UIImage?) -> Self {
        progressImage = image
        return self
    }

    /// Sets the image to use for the tracking portion of the progress bar.
    /// - Parameter image: The image to use for the tracking portion of the progress bar.
    /// - Returns: Modified progress view.
    func trackImage(_ image: UIImage?) -> Self {
        trackImage = image
        return self
    }
}
