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

// MARK: - Gradient

public struct Gradient {

    /// One color stop in the gradient

    public struct Stop {
        var color: UIColor
        var location: CGFloat
    }

    public let stops: [Stop]

    public init(stops: [Stop]) {
        self.stops = stops
    }

    /// Creates a gradient from an array of colors with evenly spaced stops.
    /// - Parameter colors: The array of colors to use in the gradient.
    public init(colors: [UIColor]) {
        let count = colors.count
        self.stops = colors.enumerated().map { index, color in
            Stop(color: color, location: count > 1 ? CGFloat(index) / CGFloat(count - 1) : 0)
        }
    }
}
