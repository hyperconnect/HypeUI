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
import RxSwift
import RxCocoa

// MARK: - DynamicLinkable (protocol)

public protocol DynamicLinkable: NSObject {}

// MARK: DynamicLinkable

public extension DynamicLinkable {
    /// Bind observable to dynamic member of key path.
    /// - Parameters:
    ///   - stream: Observable for binding.
    ///   - keyPath: A key path that supports reading from and writing to the resulting value with reference semantics.
    /// - Returns: Binded view.
    func linked<Value>(_ stream: Observable<Value>, keyPath: ReferenceWritableKeyPath<Self, Value>) -> Self {
        let disposeBag = DisposeBag()

        stream.bind(to: self.rx[dynamicMember: keyPath])
            .disposed(by: disposeBag)

        retain(disposeBag)

        return self
    }

    /// Bind observable to dynamic member of key path.
    /// - Parameters:
    ///   - stream: Observable for binding.
    ///   - keyPath: A key path that supports reading from and writing to the resulting value with reference semantics for optional.
    /// - Returns: Binded view.
    func linked<Value>(_ stream: Observable<Value>, keyPath: ReferenceWritableKeyPath<Self, Value?>) -> Self {
        let disposeBag = DisposeBag()

        stream.bind(to: self.rx[dynamicMember: keyPath])
            .disposed(by: disposeBag)
        retain(disposeBag)

        return self
    }

    /// Bind observable to dynamic member of key path.
    /// - Parameters:
    ///   - stream: Observable for binding.
    ///   - binder: RxCocoa Binder.
    /// - Returns: Binded view.
    func linked<Value>(_ stream: Observable<Value>, binder: (Self) -> Binder<Value>) -> Self {
        let disposeBag = DisposeBag()

        stream.bind(to: binder(self))
            .disposed(by: disposeBag)

        retain(disposeBag)

        return self
    }
}

// MARK: UIView (DynamicLinkable)

extension UIView: DynamicLinkable {}

// MARK: CALayer (DynamicLinkable)

extension CALayer: DynamicLinkable {}
