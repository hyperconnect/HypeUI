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

    /// Modify tint color.
    /// - Parameter tintColor: The first nondefault tint color value in the view’s hierarchy, ascending from and starting with the view itself.
    /// - Returns: Modified image.
    func tint(_ tintColor: UIColor?) -> Self {
        self.tintColor = tintColor
        return self
    }
}
