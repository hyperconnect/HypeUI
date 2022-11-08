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

public typealias Text = UILabel

// MARK: - Text

public extension Text {

    /// A view that displays one or more lines of read-only text.
    /// - Parameter text: (optional) text.
    convenience init(_ text: String?) {
        self.init()
        self.text = text
    }

    /// Modify text font.
    /// - Parameter font: An object that provides access to the font’s characteristics.
    /// - Returns: Modified text.
    func font(_ font: UIFont) -> Text {
        self.font = font
        return self
    }

    /// Modify foreground color.
    /// - Parameter color: An object that stores color data and sometimes opacity.
    /// - Returns: Modified text.
    func foregroundColor(_ color: UIColor) -> Text {
        self.textColor = color
        return self
    }

    /// Modify text alignment
    /// - Parameter textAlignment: Constants that specify text alignment.
    /// - Returns: Modified text.
    func textAligned(_ textAlignment: NSTextAlignment) -> Text {
        self.textAlignment = textAlignment
        return self
    }

    /// The maximum number of lines that text can occupy in a view.
    /// - Parameter numberOfLines: Sets the maximum number of lines that text can occupy in this view.
    /// - Returns: Modified text.
    func lineLimit(_ numberOfLines: Int) -> Text {
        self.numberOfLines = numberOfLines
        return self
    }

    /// Modify line break mode.
    /// - Parameter lineBreakMode: The technique for wrapping and truncating the label’s text.
    /// - Returns: Modified text.
    func lineBreakMode(_ lineBreakMode: NSLineBreakMode) -> Text {
        self.lineBreakMode = lineBreakMode
        return self
    }

    /// Modify adjustsfontsize to fit width.
    /// - Parameter adjustsFontSizeToFit: A Boolean value that determines whether the label reduces the text’s font size to fit the title string into the label’s bounding rectangle.
    /// - Returns: Modified text.
    func adjustedFontSize(_ adjustsFontSizeToFit: Bool) -> Text {
        self.adjustsFontSizeToFitWidth = adjustsFontSizeToFit
        return self
    }

    /// Modify minimum scale factor.
    /// - Parameter factor: The minimum scale factor for the label’s text.
    /// - Returns: Modified text.
    func minimumScaleFactor(_ factor: CGFloat) -> Text {
        self.minimumScaleFactor = factor
        return self
    }
}
