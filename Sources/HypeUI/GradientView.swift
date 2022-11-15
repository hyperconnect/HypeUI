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

// MARK: - GradientView

public class GradientView: UIView {
    public override class var layerClass: AnyClass {
        return CAGradientLayer.self
    }

    internal var gradientLayer: CAGradientLayer {
        // swiftlint:disable force_cast
        return layer as! CAGradientLayer
        // swiftlint:enable force_cast
    }

    private func update() {
        gradientLayer.colors = gradient.stops.map { $0.color.cgColor }
        gradientLayer.locations = gradient.stops.map { $0.location as NSNumber }
    }

    /// Support dark mode for gradient layer
    /// - Parameter previousTraitCollection: A trait collection encapsulates the system traits of an interface's environment.
    override public func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        super.traitCollectionDidChange(previousTraitCollection)
        update()
    }

    // MARK: Privates

    private let gradient: Gradient

    public init(gradient: Gradient) {
        self.gradient = gradient
        super.init(frame: .zero)
        update()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - GradientView (Modifier)

public extension GradientView {
    func startPoint(_ point: UnitPoint) -> Self {
        self.gradientLayer.startPoint = point
        return self
    }

    func endPoint(_ point: UnitPoint) -> Self {
        self.gradientLayer.endPoint = point
        return self
    }

    func type(_ type: CAGradientLayerType) -> Self {
        self.gradientLayer.type = type
        return self
    }
}
