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

private var associatedObjectHandle: UInt8 = 0

// MARK: - NSObject (retain)

public extension NSObject {

    /// Increments the receiver’s reference count.
    /// - Parameter object: receiver
    func retain(_ object: Any) {
        let bag: NSMutableArray
        if let associated = objc_getAssociatedObject(self, &associatedObjectHandle) as? NSMutableArray {
            bag = associated
        } else {
            bag = NSMutableArray()
            objc_setAssociatedObject(self, &associatedObjectHandle, bag, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        }

        bag.add(object)
    }
}
