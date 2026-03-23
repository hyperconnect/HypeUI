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

public typealias Image = UIImageView

// MARK: - Image

public extension Image {
    /// A view that displays an image.
    /// - Parameter image: (optional) An object that manages image data in your app.
    convenience init(_ image: UIImage?) {
        self.init()
        self.image = image
    }

    /// Modify image.
    /// - Parameter image: An object that manages image data in your app.
    /// - Returns: Modified image.
    func imaged(_ image: UIImage) -> Self {
        self.image = image
        return self
    }

    /// Sets the highlighted image displayed in the image view.
    /// - Parameter image: The image to display when the image view is highlighted.
    /// - Returns: Modified image view.
    func highlightedImage(_ image: UIImage?) -> Self {
        highlightedImage = image
        return self
    }

    /// Sets whether the image view is highlighted.
    /// - Parameter isHighlighted: A Boolean value that determines whether the image is highlighted.
    /// - Returns: Modified image view.
    func isHighlighted(_ isHighlighted: Bool) -> Self {
        self.isHighlighted = isHighlighted
        return self
    }

    /// Sets the images to use for an animation.
    /// - Parameters:
    ///   - images: An array of UIImage objects to use for an animation.
    ///   - duration: The total duration of the animation.
    /// - Returns: Modified image view.
    func animationImages(_ images: [UIImage], duration: TimeInterval) -> Self {
        animationImages = images
        animationDuration = duration
        return self
    }

    /// Sets the configuration values to use when rendering the image.
    /// Available on iOS 13 and later.
    /// - Parameter configuration: The configuration values to use when rendering the image.
    /// - Returns: Modified image view.
    @available(iOS 13.0, *)
    func symbolConfiguration(_ configuration: UIImage.SymbolConfiguration) -> Self {
        preferredSymbolConfiguration = configuration
        return self
    }
}
