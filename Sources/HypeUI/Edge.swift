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

// MARK: - Edge

public enum Edge: Int8 {
    case top
    case leading
    case bottom
    case trailing

    // MARK: Set

    public struct Set: OptionSet {
        public let rawValue: Int8

        public static let top: Set = .init(rawValue: 1 << 0)

        public static let leading: Set = .init(rawValue: 1 << 1)

        public static let bottom: Set = .init(rawValue: 1 << 2)

        public static let trailing: Set = .init(rawValue: 1 << 3)

        public static let all: Set = [.top, .leading, .bottom, .trailing]

        public static let horizontal: Set = [.leading, .trailing]

        public static let vertical: Set = [.top, .bottom]

        public init(rawValue: Int8) {
            self.rawValue = rawValue
        }
    }
}
