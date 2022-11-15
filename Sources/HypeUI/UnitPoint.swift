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

import Foundation

public typealias UnitPoint = CGPoint

// MARK: - UnitPoint

public extension UnitPoint {
    static let center = UnitPoint(x: 0.5, y: 0.5)
    static let left = UnitPoint(x: 0.0, y: 0.5)
    static let right = UnitPoint(x: 1.0, y: 0.5)
    static let top = UnitPoint(x: 0.5, y: 0.0)
    static let bottom = UnitPoint(x: 0.5, y: 1.0)
}
