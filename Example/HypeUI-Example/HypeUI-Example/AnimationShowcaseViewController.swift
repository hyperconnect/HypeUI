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
import HypeUI

// MARK: - AnimationShowcaseViewController

final class AnimationShowcaseViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Animation"
        view.backgroundColor = .systemBackground

        let fadeBox = UIView()
            .background(.systemBlue)
            .frame(width: 64, height: 64)
            .cornerRadius(14)

        let scaleBox = UIView()
            .background(.systemPurple)
            .frame(width: 64, height: 64)
            .cornerRadius(14)

        let rotateBox = UIView()
            .background(.systemOrange)
            .frame(width: 64, height: 64)
            .cornerRadius(14)

        let pulseBox = UIView()
            .background(.systemGreen)
            .frame(width: 64, height: 64)
            .cornerRadius(32)

        let shakeBox = UIView()
            .background(.systemRed)
            .frame(width: 48, height: 48)
            .cornerRadius(12)

        view.addSubviewWithFit(
            ScrollView(.vertical, showsIndicators: false) {
                VStack(spacing: 12) {
                    // Row 1
                    HStack(spacing: 12) {
                        animCard(box: fadeBox, title: "Fade", subtitle: "alpha") {
                            UIView.animate(withDuration: 0.4) {
                                fadeBox.alpha = fadeBox.alpha == 1 ? 0.15 : 1
                            }
                        }
                        animCard(box: scaleBox, title: "Scale", subtitle: "spring") {
                            let enlarged = scaleBox.transform.a < 1.4
                            UIView.animate(
                                withDuration: 0.35,
                                delay: 0,
                                usingSpringWithDamping: 0.6,
                                initialSpringVelocity: 0.5
                            ) {
                                scaleBox.transform = enlarged
                                    ? CGAffineTransform(scaleX: 1.5, y: 1.5)
                                    : .identity
                            }
                        }
                    }
                    .distributed(.fillEqually)

                    // Row 2
                    HStack(spacing: 12) {
                        animCard(box: rotateBox, title: "Rotate", subtitle: "transform") {
                            let angle = atan2(rotateBox.transform.b, rotateBox.transform.a)
                            UIView.animate(withDuration: 0.4) {
                                rotateBox.transform = CGAffineTransform(rotationAngle: angle + .pi / 2)
                            }
                        }
                        animCard(box: pulseBox, title: "Pulse", subtitle: "keyframe") {
                            UIView.animateKeyframes(withDuration: 0.6, delay: 0, options: []) {
                                UIView.addKeyframe(withRelativeStartTime: 0, relativeDuration: 0.3) {
                                    pulseBox.transform = CGAffineTransform(scaleX: 1.3, y: 1.3)
                                    pulseBox.alpha = 0.7
                                }
                                UIView.addKeyframe(withRelativeStartTime: 0.3, relativeDuration: 0.7) {
                                    pulseBox.transform = .identity
                                    pulseBox.alpha = 1
                                }
                            }
                        }
                    }
                    .distributed(.fillEqually)

                    // Row 3: Featured shake card — full width
                    Button(action: {
                        let animation = CAKeyframeAnimation(keyPath: "transform.translation.x")
                        animation.timingFunction = CAMediaTimingFunction(name: .linear)
                        animation.duration = 0.5
                        animation.values = [-12, 12, -10, 10, -6, 6, -3, 3, 0]
                        shakeBox.layer.add(animation, forKey: "shake")
                    }) {
                        HStack(alignment: .center, spacing: 16) {
                            shakeBox
                            VStack(alignment: .leading, spacing: 3) {
                                Text("Shake")
                                    .font(UIFont.systemFont(ofSize: 15, weight: .semibold))
                                    .foregroundColor(.label)
                                Text("CAKeyframeAnimation · error feedback")
                                    .font(UIFont.systemFont(ofSize: 11, weight: .regular))
                                    .foregroundColor(.secondaryLabel)
                            }
                            Spacer()
                            Text("Tap →")
                                .font(UIFont.systemFont(ofSize: 13, weight: .medium))
                                .foregroundColor(.tertiaryLabel)
                                .fixedSize()
                        }
                        .padding(.all, 16)
                        .background(.systemBackground)
                        .border(.separator, width: 1)
                        .cornerRadius(16)
                    }
                }
                .padding(.horizontal, 20)
                .padding(.vertical, 16)
            }
        )
    }

    private func animCard(
        box: UIView,
        title: String,
        subtitle: String,
        action: @escaping () -> Void
    ) -> UIView {
        Button(action: action) {
            // VStack with default .fill alignment so center() container gets full width
            VStack(spacing: 10) {
                box.center()
                    .frame(height: 110)
                    .background(.systemGray6)
                    .cornerRadius(12)
                VStack(alignment: .center, spacing: 2) {
                    Text(title)
                        .font(UIFont.systemFont(ofSize: 14, weight: .semibold))
                        .foregroundColor(.label)
                        .textAligned(.center)
                    Text(subtitle)
                        .font(UIFont.systemFont(ofSize: 11, weight: .regular))
                        .foregroundColor(.secondaryLabel)
                        .textAligned(.center)
                }
                Text("Tap to animate")
                    .font(UIFont.systemFont(ofSize: 10, weight: .medium))
                    .foregroundColor(.systemBlue)
                    .textAligned(.center)
            }
            .padding(.all, 12)
            .background(.systemBackground)
            .border(.separator, width: 1)
            .cornerRadius(16)
        }
    }
}
