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

public typealias Button = UIButton

// MARK: - Button

public extension Button {

    /// Button with action closure.
    /// - Parameter action: Escaping action closure.
    convenience init(action: @escaping () -> Void) {
        self.init()
        _ = rx.tap.subscribe(onNext: action)
    }

    /// Button with action closure.
    /// - Parameters:
    ///   - action: Escaping action closure.
    ///   - view: UI for button.
    convenience init(action: @escaping () -> Void, _ view: () -> UIView) {
        self.init()
        let buttonView = view()
        _ = rx.tap
            .map { Void() }
            .subscribe(onNext: action)
        self.addSubviewWithFit(buttonView.allowsHitTesting(false))

        _ = Observable<CGFloat>
            .merge(
                rx.controlEvent(.touchDown).map { 0.5 },
                rx.controlEvent(.touchUpInside).map { 1.0 },
                rx.controlEvent(.touchUpOutside).map { 1.0 },
                rx.controlEvent(.touchDragInside).map { 0.5 },
                rx.controlEvent(.touchDragOutside).map { 1.0 }
            )
            .bind(to: buttonView.rx.alpha)
    }
}
