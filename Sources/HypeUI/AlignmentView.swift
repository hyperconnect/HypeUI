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

// MARK: - AlignmentView

public struct AlignmentView {
    private let alignment: Alignment
    private let view: ViewBuildable

    init(alignment: Alignment, view: ViewBuildable) {
        self.alignment = alignment
        self.view = view
    }
}

// MARK: - AlignmentView (ViewBuildable)

extension AlignmentView: ViewBuildable {
    public func build() -> UIView {
        HStack(alignment: alignment.horizontalAlignment) {
            Spacer()
                .linked(.just(!alignment.isBottom), keyPath: \.isHidden)
            VStack(alignment: alignment.verticalAlignment) {
                Spacer()
                    .linked(.just(!alignment.isTrailing), keyPath: \.isHidden)
                view
                Spacer()
                    .linked(.just(!alignment.isLeading), keyPath: \.isHidden)
            }
            Spacer()
                .linked(.just(!alignment.isTop), keyPath: \.isHidden)
        }
    }
}
