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

// MARK: - Alignment

public enum Alignment {
    case topLeading
    case top
    case topTrailing
    case leading
    case center
    case trailing
    case bottomLeading
    case bottom
    case bottomTrailing

    var isLeading: Bool {
        switch self {
        case .topLeading, .leading, .bottomLeading:
            return true
        default:
            return false
        }
    }

    var isTop: Bool {
        switch self {
        case .topLeading, .top, .topTrailing:
            return true
        default:
            return false
        }
    }

    var isTrailing: Bool {
        switch self {
        case .topTrailing, .trailing, .bottomTrailing:
            return true
        default:
            return false
        }
    }

    var isBottom: Bool {
        switch self {
        case .bottomLeading, .bottom, .bottomTrailing:
            return true
        default:
            return false
        }
    }

    var horizontalAlignment: UIStackView.Alignment {
        if isTop {
            return .top
        } else if isBottom {
            return .bottom
        } else {
            return .center
        }
    }

    var verticalAlignment: UIStackView.Alignment {
        if isLeading {
            return .leading
        } else if isTrailing {
            return .trailing
        } else {
            return .center
        }
    }
}
