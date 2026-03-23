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

// MARK: - UISlider (Slider)

private var uiSliderOnChangeKey: UInt8 = 0

public extension UISlider {

    private var onChangeAction: ((Float) -> Void)? {
        get { objc_getAssociatedObject(self, &uiSliderOnChangeKey) as? (Float) -> Void }
        set { objc_setAssociatedObject(self, &uiSliderOnChangeKey, newValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC) }
    }

    /// Sets the current value of the slider.
    /// - Parameters:
    ///   - value: The new value to assign to the value property.
    ///   - animated: Specifies whether to animate the transition, default is false.
    /// - Returns: Modified slider.
    func value(_ value: Float, animated: Bool = false) -> Self {
        setValue(value, animated: animated)
        return self
    }

    /// Sets the minimum value of the slider.
    /// - Parameter value: The minimum value of the slider.
    /// - Returns: Modified slider.
    func minimumValue(_ value: Float) -> Self {
        minimumValue = value
        return self
    }

    /// Sets the maximum value of the slider.
    /// - Parameter value: The maximum value of the slider.
    /// - Returns: Modified slider.
    func maximumValue(_ value: Float) -> Self {
        maximumValue = value
        return self
    }

    /// Sets whether changes in the slider's value generate continuous update events.
    /// - Parameter isContinuous: A Boolean value indicating whether changes in the slider's value generate continuous update events.
    /// - Returns: Modified slider.
    func isContinuous(_ isContinuous: Bool) -> Self {
        self.isContinuous = isContinuous
        return self
    }

    /// Sets the color used to tint the default minimum track images.
    /// - Parameter color: The color used to tint the default minimum track images.
    /// - Returns: Modified slider.
    func minimumTrackTintColor(_ color: UIColor?) -> Self {
        minimumTrackTintColor = color
        return self
    }

    /// Sets the color used to tint the default maximum track images.
    /// - Parameter color: The color used to tint the default maximum track images.
    /// - Returns: Modified slider.
    func maximumTrackTintColor(_ color: UIColor?) -> Self {
        maximumTrackTintColor = color
        return self
    }

    /// Sets the color used to tint the default thumb images.
    /// - Parameter color: The color used to tint the default thumb images.
    /// - Returns: Modified slider.
    func thumbTintColor(_ color: UIColor?) -> Self {
        thumbTintColor = color
        return self
    }

    /// Adds an action to perform when the slider value changes.
    /// - Parameter action: A closure that receives the new slider value.
    /// - Returns: Modified slider.
    func onChange(_ action: @escaping (Float) -> Void) -> Self {
        onChangeAction = action
        removeTarget(self, action: #selector(handleSliderValueChanged), for: .valueChanged)
        addTarget(self, action: #selector(handleSliderValueChanged), for: .valueChanged)
        return self
    }

    @objc internal func handleSliderValueChanged() {
        onChangeAction?(value)
    }
}
