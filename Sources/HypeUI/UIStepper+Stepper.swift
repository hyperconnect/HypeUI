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

// MARK: - UIStepper (Stepper)

private var uiStepperOnChangeKey: UInt8 = 0

public extension UIStepper {

    private var onChangeAction: ((Double) -> Void)? {
        get { objc_getAssociatedObject(self, &uiStepperOnChangeKey) as? (Double) -> Void }
        set { objc_setAssociatedObject(self, &uiStepperOnChangeKey, newValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC) }
    }

    /// Sets the numeric value of the stepper.
    /// - Parameter value: The numeric value of the stepper.
    /// - Returns: Modified stepper.
    func value(_ value: Double) -> Self {
        self.value = value
        return self
    }

    /// Sets the lowest possible numeric value for the stepper.
    /// - Parameter value: The lowest possible numeric value for the stepper.
    /// - Returns: Modified stepper.
    func minimumValue(_ value: Double) -> Self {
        minimumValue = value
        return self
    }

    /// Sets the highest possible numeric value for the stepper.
    /// - Parameter value: The highest possible numeric value for the stepper.
    /// - Returns: Modified stepper.
    func maximumValue(_ value: Double) -> Self {
        maximumValue = value
        return self
    }

    /// Sets the step, or increment, value for the stepper.
    /// - Parameter value: The step, or increment, value for the stepper.
    /// - Returns: Modified stepper.
    func stepValue(_ value: Double) -> Self {
        stepValue = value
        return self
    }

    /// Sets whether the stepper value wraps around from the maximum to minimum value.
    /// - Parameter wraps: A Boolean value that determines whether the stepper can wrap its value to the minimum or maximum value when incrementing and decrementing the value.
    /// - Returns: Modified stepper.
    func wraps(_ wraps: Bool) -> Self {
        self.wraps = wraps
        return self
    }

    /// Sets whether the stepper automatically repeats when a user presses and holds a stepper button.
    /// - Parameter autorepeat: A Boolean value that determines whether to repeatedly change the stepper's value as the user presses and holds a stepper button.
    /// - Returns: Modified stepper.
    func autorepeat(_ autorepeat: Bool) -> Self {
        self.autorepeat = autorepeat
        return self
    }

    /// Sets whether the stepper changes its value immediately when a user presses and holds a stepper button.
    /// - Parameter isContinuous: A Boolean value that determines whether to send value changes during user interaction or only when user interaction ends.
    /// - Returns: Modified stepper.
    func isContinuous(_ isContinuous: Bool) -> Self {
        self.isContinuous = isContinuous
        return self
    }

    /// Adds an action to perform when the stepper value changes.
    /// - Parameter action: A closure that receives the new stepper value.
    /// - Returns: Modified stepper.
    func onChange(_ action: @escaping (Double) -> Void) -> Self {
        onChangeAction = action
        removeTarget(self, action: #selector(handleStepperValueChanged), for: .valueChanged)
        addTarget(self, action: #selector(handleStepperValueChanged), for: .valueChanged)
        return self
    }

    @objc internal func handleStepperValueChanged() {
        onChangeAction?(value)
    }
}
