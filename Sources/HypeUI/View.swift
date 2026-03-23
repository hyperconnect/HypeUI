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

import SnapKit
import UIKit

// MARK: -  UIView

public extension UIView {
    /// Sets the priority with which a view resists being made larger than its intrinsic size.
    /// - Parameter priority: The new priority.
    /// - Returns: Modified view.
    func setHContentHugging(priority: UILayoutPriority) -> Self {
        setContentHuggingPriority(priority, for: .horizontal)
        return self
    }

    /// Sets the priority with which a view resists being made larger than its intrinsic size.
    /// - Parameter priority: The new priority.
    /// - Returns: Modified view.
    func setVContentHugging(priority: UILayoutPriority) -> Self {
        setContentHuggingPriority(priority, for: .vertical)
        return self
    }

    /// Sets the priority with which a view resists being made smaller than its intrinsic size.
    /// - Parameter priority: The new priority.
    /// - Returns: Modified view.
    func setHContentCompressionResistance(priority: UILayoutPriority) -> Self {
        setContentCompressionResistancePriority(priority, for: .horizontal)
        return self
    }

    /// Sets the priority with which a view resists being made smaller than its intrinsic size.
    /// - Parameter priority: The new priority.
    /// - Returns: modified view
    func setVContentCompressionResistance(priority: UILayoutPriority) -> Self {
        setContentCompressionResistancePriority(priority, for: .vertical)
        return self
    }

    /// Modify the ratio of the size of the view.
    /// - Parameter ratio: Size ratio.
    /// - Returns: Modified view.
    func makeRatio(_ ratio: CGFloat) -> Self {
        snp.makeConstraints { maker in
            maker.height.equalTo(self.snp.width).multipliedBy(ratio)
        }
        return self
    }

    /// Modify corner radius.
    /// - Parameter radius: The radius to use when drawing rounded corners for the layer’s background.
    /// - Returns: Modified view.
    func cornerRadius(_ radius: CGFloat) -> Self {
        applyRound(radius)
        return self
    }

    /// Modify corner radius.
    /// - Parameter radius: The radius to use when drawing rounded corners for the layer’s background.
    /// - Parameter corners: A mask used to apply a radius to a specific corner.
    /// - Returns: Modified view.
    func cornerRadius(_ radius: CGFloat, corners: CACornerMask? = nil) -> Self {
        applyRound(radius, corners: corners)
        return self
    }

    /// Modify corner radius.
    /// - Parameter radius: The radius to use when drawing rounded corners for the layer’s background.
    /// - Parameter corners: A mask used to apply a radius to a specific corner.
    private func applyRound(_ radius: CGFloat, corners: CACornerMask? = nil) {
        if let corners = corners {
            layer.maskedCorners = corners
        }
        layer.cornerRadius = radius
        layer.masksToBounds = true
    }

    /// Modify border style.
    /// - Parameters:
    ///   - color: The color of the layer’s border.
    ///   - width: The width of the layer’s border.
    /// - Returns: Modified view
    func border(_ color: UIColor, width: CGFloat) -> Self {
        layer.borderColor = color.cgColor
        layer.borderWidth = width
        return self
    }

    /// Modifiy background color.
    /// - Parameter color: An object that stores color data and sometimes opacity.
    /// - Returns: Modified view
    func background(_ color: UIColor) -> Self {
        backgroundColor = color
        return self
    }

    /// Modify content mode.
    /// - Parameter contentMode: Options to specify how a view adjusts its content when its size changes.
    /// - Returns: Modified view.
    func makeContentMode(_ contentMode: ContentMode) -> Self {
        self.contentMode = contentMode
        return self
    }

    /// Positions this view within an invisible frame with the specified size.
    /// - Parameters:
    ///   - width: A fixed width for the resulting view. If width is nil, the resulting view assumes this view’s sizing behavior.
    ///   - height: A fixed height for the resulting view. If height is nil, the resulting view assumes this view’s sizing behavior.
    /// - Returns: Modified view.
    func frame(width: CGFloat? = nil, height: CGFloat? = nil) -> Self {
        if let width = width {
            widthAnchor.constraint(equalToConstant: width).isActive = true
        }

        if let height = height {
            heightAnchor.constraint(equalToConstant: height).isActive = true
        }

        return self
    }

    /// Adds an equal padding amount to specific edges of this view.
    /// - Parameter inset: The inset distances for views.
    /// - Returns: Modified view.
    func padding(_ inset: UIEdgeInsets) -> UIView {
        let view = UIView()
        view.addSubview(self)
        snp.makeConstraints { maker in
            maker.directionalEdges.equalTo(inset)
        }
        return view
    }

    /// Adds an equal padding amount to specific edges of this view.
    /// - Parameters:
    ///   - edges: The set of edges to pad for this view.
    ///   - length: An amount, given in points, to pad this view on the specified edges.
    /// - Returns: Modified view.
    func padding(_ edges: Edge.Set, _ length: CGFloat) -> UIView {
        let paddingView = UIView()
        translatesAutoresizingMaskIntoConstraints = false
        paddingView.addSubview(self)

        NSLayoutConstraint.activate([
            topAnchor.constraint(equalTo: paddingView.topAnchor, constant: edges.contains(.top) ? length : 0),
            leadingAnchor.constraint(equalTo: paddingView.leadingAnchor, constant: edges.contains(.leading) ? length : 0),
            bottomAnchor.constraint(equalTo: paddingView.bottomAnchor, constant: edges.contains(.bottom) ? -length : 0),
            trailingAnchor.constraint(equalTo: paddingView.trailingAnchor, constant: edges.contains(.trailing) ? -length : 0),
        ])

        return paddingView
    }

    /// Configures whether this view participates in hit test operations.
    /// - Parameter allows: A value type whose instances are either true or false.
    /// - Returns: Modified view.
    func allowsHitTesting(_ allows: Bool) -> Self {
        isUserInteractionEnabled = allows
        return self
    }

    /// Adds a view to the end of the receiver’s list of subviews with fit
    /// - Parameter view: Modified view.
    func addSubviewWithFit(_ view: UIView) {
        addSubview(view)
        view.snp.makeConstraints { $0.directionalEdges.equalToSuperview() }
    }

    /// Setting sublayers are clipped to the layer’s bounds.
    /// - Parameter masksToBounds: A Boolean indicating whether sublayers are clipped to the layer’s bounds.
    /// - Returns: Modified view.
    func masksToBounds(_ masksToBounds: Bool) -> Self {
        layer.masksToBounds = masksToBounds
        return self
    }

    /// Uses the string you specify to identify the view.
    /// - Parameter identifier: A string that identifies the element.
    /// - Returns: Modified view.
    func accessibilityIdentifier(_ identifier: String) -> Self {
        accessibilityIdentifier = identifier
        return self
    }

    /// Layers the views that you specify in front of this view.
    /// - Parameters:
    ///   - alignment: An alignment in both axes.
    ///   - view: Buildable view content.
    /// - Returns: Modified view.
    func overlay(alignment: Alignment = .center, view: ViewBuildable) -> UIView {
        ZStack {
            self
            AlignmentView(alignment: alignment, view: view)
        }
    }

    /// Layers the views that you specify behind this view.
    /// - Parameters:
    ///   - alignment: An alignment in both axes.
    ///   - view: Buildable view content.
    /// - Returns: Modified view.
    func background(alignment: Alignment = .center, view: ViewBuildable) -> UIView {
        ZStack {
            AlignmentView(alignment: alignment, view: view)
            self
        }
    }
    
    /// Wraps and centers the current view in a new parent View.
    ///
    /// - Returns: The new parent View with this view centered inside.
    func center() -> UIView {
        let view = UIView()
        view.addSubview(self)
        snp.makeConstraints { maker in
            maker.center.equalToSuperview()
        }
        return view
    }
    
    /// Applies a tint color to the view and returns the modified view for chaining.
    ///
    /// This extension function sets the `tintColor` property of the view to a specified color, allowing for easy modification of the view's appearance in a method chaining style.
    ///
    /// - Parameter tintColor: The color to set as the tint color of the view.
    /// - Returns: The view instance with the updated tint color.
    func tint(_ tintColor: UIColor) -> Self {
        self.tintColor = tintColor
        return self
    }
    
    /// Sets the opacity of the view and returns the modified view for chaining.
    ///
    /// This function adjusts the `alpha` property of the view to control its opacity, allowing for fluent style coding.
    /// The return type of 'Self' ensures that the function can be used with any subclass of UIView that inherits this method.
    ///
    /// - Parameter opacity: The opacity level to set, where 1 is fully opaque and 0 is completely transparent.
    /// - Returns: The view instance with the updated opacity.
    func opacity(_ opacity: CGFloat) -> Self {
        alpha = opacity
        return self
    }
    
    /// Applies a scale transformation to the view.
    ///
    /// - Parameters:
    ///   - scaleX: The scale factor in the x-axis.
    ///   - scaleY: The scale factor in the y-axis.
    /// - Returns: The view with the scaling applied, allowing for chaining.
    func scaleEffect(scaleX: CGFloat, scaleY: CGFloat) -> Self {
        self.transform = CGAffineTransform(scaleX: scaleX, y: scaleY)
        return self
    }
    
    /// Applies a rotation transformation to the view.
    ///
    /// - Parameters:
    ///   - angle: The rotation angle in degrees.
    ///   - anchor: The anchor point of the rotation, default is center.
    /// - Returns: The view with the rotation applied, allowing for chaining.
    func rotationEffect(_ angle: CGFloat, anchor: CGPoint = CGPoint(x: 0.5, y: 0.5)) -> Self {
        var transform = CGAffineTransform.identity
        transform = transform.translatedBy(x: anchor.x, y: anchor.y)
        transform = transform.rotated(by: angle * CGFloat.pi / 180)
        transform = transform.translatedBy(x: -anchor.x, y: -anchor.y)
        self.transform = transform
        return self
    }

    /// Sets whether the view is hidden.
    /// - Parameter hidden: A Boolean value that determines whether the view is hidden.
    /// - Returns: Modified view.
    func hidden(_ hidden: Bool) -> Self {
        isHidden = hidden
        return self
    }

    /// Sets whether user interactions are disabled for this view.
    /// - Parameter disabled: A Boolean value that determines whether user interactions are disabled.
    /// - Returns: Modified view.
    func disabled(_ disabled: Bool) -> Self {
        isUserInteractionEnabled = !disabled
        return self
    }

    /// Sets an integer that you can use to identify view objects in your application.
    /// - Parameter value: An integer that you can use to identify view objects in your application.
    /// - Returns: Modified view.
    func tag(_ value: Int) -> Self {
        tag = value
        return self
    }

    /// Sets the order in which the view is composited on top of or underneath other views on the z axis.
    /// - Parameter value: The z-axis position of the layer relative to other layers.
    /// - Returns: Modified view.
    func zIndex(_ value: CGFloat) -> Self {
        layer.zPosition = value
        return self
    }

    /// Fixes the view at its ideal size in both dimensions.
    /// Sets content compression resistance and content hugging priority to required,
    /// preventing the view from shrinking below or growing beyond its intrinsic content size.
    /// - Returns: Modified view.
    func fixedSize() -> Self {
        setContentCompressionResistancePriority(.required, for: .horizontal)
        setContentCompressionResistancePriority(.required, for: .vertical)
        setContentHuggingPriority(.required, for: .horizontal)
        setContentHuggingPriority(.required, for: .vertical)
        return self
    }
}

// MARK: - UIStackView

public extension UIStackView {

    /// Modify stack’s distribution layout.
    /// - Parameter distribution: The layout that defines the size and position of the arranged views along the stack view’s axis.
    /// - Returns: Modified stack view.
    func distributed(_ distribution: UIStackView.Distribution) -> Self {
        self.distribution = distribution
        return self
    }

    /// Sets the spacing between arranged subviews.
    /// - Parameter spacing: The distance in points between the adjacent edges of the stack view’s arranged views.
    /// - Returns: Modified stack view.
    func spacing(_ spacing: CGFloat) -> Self {
        self.spacing = spacing
        return self
    }

    /// Sets the alignment of arranged subviews perpendicular to the stack view’s axis.
    /// - Parameter alignment: The alignment of the arranged subviews perpendicular to the stack view’s axis.
    /// - Returns: Modified stack view.
    func alignment(_ alignment: UIStackView.Alignment) -> Self {
        self.alignment = alignment
        return self
    }

    /// Sets the layout margins for the stack view and enables margin-relative layout.
    /// - Parameter insets: The layout margins to apply.
    /// - Returns: Modified stack view.
    func layoutMargins(_ insets: UIEdgeInsets) -> Self {
        layoutMargins = insets
        isLayoutMarginsRelativeArrangement = true
        return self
    }
}
