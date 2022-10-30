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

// MARK: - UIView (Passthrought)

extension UIView {

    /// [Hit-Testing in iOS](http://smnh.me/hit-testing-in-ios/)
    func passthrough(_ point: CGPoint, with event: UIEvent?) -> UIView? {
        guard isUserInteractionEnabled else { return nil }
        guard isHidden == false else { return nil }
        guard alpha > 0.01 else { return nil }
        guard self.point(inside: point, with: event) else { return nil }

        for subview in subviews.reversed() {
            if let view = subview.hitTest(subview.convert(point, from: self), with: event) {
                return view
            }
        }
        return nil
    }
}

