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

// MARK: - ComponentGalleryViewController

final class ComponentGalleryViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Component Gallery"
        view.backgroundColor = .systemBackground

        view.addSubviewWithFit(
            ScrollView(.vertical, showsIndicators: false) {
                VStack(spacing: 0) {
                    heroHeader()
                    typeSection()
                    colorSection()
                    buttonSection()
                    gradientSection()
                    surfaceSection()
                    Spacer().frame(height: 40)
                }
            }
        )
    }

    // MARK: - Hero

    private func heroHeader() -> UIView {
        ZStack {
            LinearGradient(
                gradient: Gradient(colors: [UIColor.systemIndigo, UIColor.systemBlue]),
                startPoint: UnitPoint(x: 0, y: 0),
                endPoint: UnitPoint(x: 1, y: 1)
            )
            VStack(alignment: .center, spacing: 6) {
                Text("Design System")
                    .font(UIFont.systemFont(ofSize: 28, weight: .bold))
                    .foregroundColor(.white)
                    .textAligned(.center)
                Text("HypeUI Component Gallery")
                    .font(UIFont.systemFont(ofSize: 15, weight: .regular))
                    .foregroundColor(UIColor.white.withAlphaComponent(0.8))
                    .textAligned(.center)
            }
            .padding(.all, 32)
        }
        .frame(height: 140)
        .masksToBounds(true)
    }

    // MARK: - Typography

    private func typeSection() -> UIView {
        VStack(alignment: .leading, spacing: 0) {
            sectionHeader(icon: "Aa", title: "Typography")

            VStack(alignment: .leading, spacing: 0) {
                typeRow(sample: "Large Title",   spec: "34 / Bold",    font: UIFont.systemFont(ofSize: 34, weight: .bold))
                typeDivider()
                typeRow(sample: "Title 1",       spec: "28 / Bold",    font: UIFont.systemFont(ofSize: 28, weight: .bold))
                typeDivider()
                typeRow(sample: "Title 2",       spec: "22 / Bold",    font: UIFont.systemFont(ofSize: 22, weight: .bold))
                typeDivider()
                typeRow(sample: "Headline",      spec: "17 / Semibold", font: UIFont.systemFont(ofSize: 17, weight: .semibold))
                typeDivider()
                typeRow(sample: "Body",          spec: "17 / Regular", font: UIFont.systemFont(ofSize: 17, weight: .regular))
                typeDivider()
                typeRow(sample: "Callout",       spec: "16 / Regular", font: UIFont.systemFont(ofSize: 16, weight: .regular))
                typeDivider()
                typeRow(sample: "Subheadline",   spec: "15 / Regular", font: UIFont.systemFont(ofSize: 15, weight: .regular))
                typeDivider()
                typeRow(sample: "Footnote",      spec: "13 / Regular", font: UIFont.systemFont(ofSize: 13, weight: .regular))
                typeDivider()
                typeRow(sample: "Caption",       spec: "12 / Regular", font: UIFont.systemFont(ofSize: 12, weight: .regular))
            }
            .background(.secondarySystemBackground)
            .cornerRadius(14)
            .padding(.horizontal, 20)
            .padding(.bottom, 8)
        }
    }

    private func typeRow(sample: String, spec: String, font: UIFont) -> UIView {
        HStack(alignment: .center, spacing: 12) {
            Text(sample)
                .font(font)
                .foregroundColor(.label)
                .setHContentHugging(priority: .defaultLow)
            Spacer()
            Text(spec)
                .font(UIFont.monospacedSystemFont(ofSize: 11, weight: .regular))
                .foregroundColor(.tertiaryLabel)
                .fixedSize()
        }
        .padding(.horizontal, 16)
        .padding(.vertical, 12)
    }

    private func typeDivider() -> UIView {
        Spacer().frame(height: 1).background(.separator).padding(.leading, 16)
    }

    // MARK: - Colors

    private func colorSection() -> UIView {
        let palette: [(UIColor, String)] = [
            (.systemBlue,   "Blue"),
            (.systemIndigo, "Indigo"),
            (.systemPurple, "Purple"),
            (.systemPink,   "Pink"),
            (.systemRed,    "Red"),
            (.systemOrange, "Orange"),
            (.systemYellow, "Yellow"),
            (.systemGreen,  "Green"),
            (.systemTeal,   "Teal"),
            (.systemBrown,  "Brown"),
        ]

        return VStack(alignment: .leading, spacing: 0) {
            sectionHeader(icon: "◉", title: "Color System")

            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 12) {
                    palette.map { color, name -> UIView in
                        VStack(alignment: .center, spacing: 6) {
                            UIView()
                                .background(color)
                                .frame(width: 52, height: 52)
                                .cornerRadius(14)
                            Text(name)
                                .font(UIFont.systemFont(ofSize: 11, weight: .medium))
                                .foregroundColor(.secondaryLabel)
                                .textAligned(.center)
                        }
                    }
                }
                .padding(.horizontal, 20)
                .padding(.vertical, 4)
            }
            .padding(.bottom, 8)
        }
    }

    // MARK: - Buttons

    private func buttonSection() -> UIView {
        VStack(alignment: .leading, spacing: 0) {
            sectionHeader(icon: "⬡", title: "Buttons")

            VStack(alignment: .leading, spacing: 12) {
                // Row 1: Primary + Secondary
                HStack(spacing: 10) {
                    Button(action: {}) {
                        Text("Primary")
                            .font(UIFont.systemFont(ofSize: 15, weight: .semibold))
                            .foregroundColor(.white)
                            .textAligned(.center)
                            .padding(.vertical, 13)
                            .background(.systemBlue)
                            .cornerRadius(10)
                    }
                    Button(action: {}) {
                        Text("Secondary")
                            .font(UIFont.systemFont(ofSize: 15, weight: .semibold))
                            .foregroundColor(.systemBlue)
                            .textAligned(.center)
                            .padding(.vertical, 12)
                            .background(.systemBackground)
                            .border(.systemBlue, width: 1.5)
                            .cornerRadius(10)
                    }
                }
                .distributed(.fillEqually)

                // Row 2: Destructive + Ghost
                HStack(spacing: 10) {
                    Button(action: {}) {
                        Text("Destructive")
                            .font(UIFont.systemFont(ofSize: 15, weight: .semibold))
                            .foregroundColor(.white)
                            .textAligned(.center)
                            .padding(.vertical, 13)
                            .background(.systemRed)
                            .cornerRadius(10)
                    }
                    Button(action: {}) {
                        Text("Ghost")
                            .font(UIFont.systemFont(ofSize: 15, weight: .semibold))
                            .foregroundColor(.label)
                            .textAligned(.center)
                            .padding(.vertical, 12)
                            .background(.systemGray6)
                            .cornerRadius(10)
                    }
                }
                .distributed(.fillEqually)

                // Row 3: Pill variants
                HStack(alignment: .center, spacing: 10) {
                    Button(action: {}) {
                        HStack(alignment: .center, spacing: 6) {
                            Text("★")
                                .font(UIFont.systemFont(ofSize: 13))
                                .foregroundColor(.white)
                                .fixedSize()
                            Text("Favorite")
                                .font(UIFont.systemFont(ofSize: 14, weight: .semibold))
                                .foregroundColor(.white)
                        }
                        .padding(.horizontal, 18)
                        .padding(.vertical, 10)
                        .background(.systemYellow)
                        .cornerRadius(22)
                    }
                    Button(action: {}) {
                        Text("Gradient")
                            .font(UIFont.systemFont(ofSize: 14, weight: .semibold))
                            .foregroundColor(.white)
                            .padding(.horizontal, 18)
                            .padding(.vertical, 10)
                            .background(view: LinearGradient(
                                gradient: Gradient(colors: [.systemPurple, .systemPink]),
                                startPoint: .left,
                                endPoint: .right
                            ))
                            .cornerRadius(22)
                    }
                }
            }
            .padding(.horizontal, 20)
            .padding(.bottom, 8)
        }
    }

    // MARK: - Gradients

    private func gradientSection() -> UIView {
        let gradients: [(Gradient, String, UnitPoint, UnitPoint)] = [
            (Gradient(colors: [.systemBlue, .systemPurple]),   "Ocean",   UnitPoint(x: 0, y: 0), UnitPoint(x: 1, y: 1)),
            (Gradient(colors: [.systemOrange, .systemPink]),   "Sunset",  UnitPoint(x: 0, y: 0), UnitPoint(x: 1, y: 1)),
            (Gradient(colors: [.systemGreen, .systemTeal]),    "Meadow",  .top,                  .bottom),
            (Gradient(colors: [.systemIndigo, .systemBlue, .systemTeal]), "Aurora", UnitPoint(x: 0, y: 0), UnitPoint(x: 1, y: 1)),
        ]

        return VStack(alignment: .leading, spacing: 0) {
            sectionHeader(icon: "◈", title: "Gradients")

            VStack(spacing: 10) {
                // Top row: 3 small gradient chips
                HStack(spacing: 10) {
                    gradients.prefix(3).map { gradient, name, start, end -> UIView in
                        ZStack {
                            LinearGradient(gradient: gradient, startPoint: start, endPoint: end)
                            Text(name)
                                .font(UIFont.systemFont(ofSize: 13, weight: .semibold))
                                .foregroundColor(.white)
                                .textAligned(.center)
                        }
                        .frame(height: 72)
                        .cornerRadius(12)
                        .masksToBounds(true)
                    }
                }
                .distributed(.fillEqually)

                // Bottom: large featured gradient
                ZStack {
                    LinearGradient(
                        gradient: gradients[3].0,
                        startPoint: gradients[3].2,
                        endPoint: gradients[3].3
                    )
                    VStack(alignment: .center, spacing: 4) {
                        Text(gradients[3].1)
                            .font(UIFont.systemFont(ofSize: 20, weight: .bold))
                            .foregroundColor(.white)
                            .textAligned(.center)
                        Text("Multi-stop gradient")
                            .font(UIFont.systemFont(ofSize: 12, weight: .regular))
                            .foregroundColor(UIColor.white.withAlphaComponent(0.8))
                            .textAligned(.center)
                    }
                }
                .frame(height: 80)
                .cornerRadius(12)
                .masksToBounds(true)
            }
            .padding(.horizontal, 20)
            .padding(.bottom, 8)
        }
    }

    // MARK: - Surfaces

    private func surfaceSection() -> UIView {
        VStack(alignment: .leading, spacing: 0) {
            sectionHeader(icon: "▣", title: "Surfaces & Layout")

            VStack(spacing: 12) {
                // Shadow card
                ZStack {
                    UIView()
                        .background(.secondarySystemBackground)
                        .cornerRadius(14)
                    HStack(alignment: .center, spacing: 14) {
                        UIView()
                            .background(.systemBlue)
                            .frame(width: 44, height: 44)
                            .cornerRadius(12)
                        VStack(alignment: .leading, spacing: 3) {
                            Text("Elevated Card")
                                .font(UIFont.systemFont(ofSize: 15, weight: .semibold))
                                .foregroundColor(.label)
                            Text("Background + cornerRadius")
                                .font(UIFont.monospacedSystemFont(ofSize: 11, weight: .regular))
                                .foregroundColor(.tertiaryLabel)
                        }
                        Spacer()
                        Text("→")
                            .font(UIFont.systemFont(ofSize: 18))
                            .foregroundColor(.tertiaryLabel)
                    }
                    .padding(.all, 16)
                }

                // Border card
                ZStack {
                    UIView()
                        .background(.systemBackground)
                        .border(.separator, width: 1)
                        .cornerRadius(14)
                    HStack(alignment: .center, spacing: 14) {
                        UIView()
                            .background(.systemPurple)
                            .frame(width: 44, height: 44)
                            .cornerRadius(12)
                        VStack(alignment: .leading, spacing: 3) {
                            Text("Outlined Card")
                                .font(UIFont.systemFont(ofSize: 15, weight: .semibold))
                                .foregroundColor(.label)
                            Text("border(_:width:) + cornerRadius")
                                .font(UIFont.monospacedSystemFont(ofSize: 11, weight: .regular))
                                .foregroundColor(.tertiaryLabel)
                        }
                        Spacer()
                        Text("→")
                            .font(UIFont.systemFont(ofSize: 18))
                            .foregroundColor(.tertiaryLabel)
                    }
                    .padding(.all, 16)
                }

                // Padding rainbow
                Text("Padding")
                    .foregroundColor(.white)
                    .textAligned(.center)
                    .font(UIFont.systemFont(ofSize: 13, weight: .bold))
                    .padding(.all, 8)
                    .background(.systemRed)
                    .padding(.all, 6)
                    .background(.systemOrange)
                    .padding(.all, 6)
                    .background(.systemYellow)
                    .padding(.all, 6)
                    .background(.systemGreen)
                    .padding(.all, 6)
                    .background(.systemBlue)
                    .cornerRadius(4)

                // Corner radius scale
                HStack(alignment: .center, spacing: 12) {
                    [("0", CGFloat(0)), ("8", 8), ("16", 16), ("24", 24), ("∞", 30)].map { label, radius -> UIView in
                        VStack(alignment: .center, spacing: 6) {
                            UIView()
                                .background(.systemIndigo)
                                .frame(width: 48, height: 48)
                                .cornerRadius(radius)
                            Text("r=\(label)")
                                .font(UIFont.monospacedSystemFont(ofSize: 10, weight: .regular))
                                .foregroundColor(.secondaryLabel)
                                .textAligned(.center)
                        }
                    }
                }
                .distributed(.fillEqually)
            }
            .padding(.horizontal, 20)
            .padding(.bottom, 8)
        }
    }

    // MARK: - Helpers

    private func sectionHeader(icon: String, title: String) -> UIView {
        VStack(alignment: .leading, spacing: 16) {
            Spacer().frame(height: 8)
            HStack(alignment: .center, spacing: 10) {
                Text(icon)
                    .font(UIFont.systemFont(ofSize: 16, weight: .bold))
                    .foregroundColor(.secondaryLabel)
                    .fixedSize()
                Text(title)
                    .font(UIFont.systemFont(ofSize: 20, weight: .bold))
                    .foregroundColor(.label)
                Spacer()
            }
            .padding(.horizontal, 20)
            Spacer()
                .frame(height: 1)
                .background(.separator)
                .padding(.horizontal, 20)
                .padding(.bottom, 12)
        }
    }
}
