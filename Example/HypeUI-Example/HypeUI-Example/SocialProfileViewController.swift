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
import RxSwift

// MARK: - SocialProfileViewController

final class SocialProfileViewController: UIViewController {

    @Behavior var isFollowing = false
    @Behavior var followerCount = 12_400

    private let disposeBag = DisposeBag()

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Social Profile"
        view.backgroundColor = .systemBackground

        let heroImageView = Image(nil)
            .makeContentMode(.scaleAspectFill)
            .frame(height: 260)
            .masksToBounds(true)
        heroImageView.loadRemote(seed: 20, width: 800, height: 520)

        let avatarImageView = Image(nil)
            .makeContentMode(.scaleAspectFill)
            .frame(width: 88, height: 88)
            .cornerRadius(44)
            .border(.white, width: 3)
        avatarImageView.loadRemote(seed: 21, width: 176, height: 176)

        let followerLabel = Text("12400")
            .font(UIFont.systemFont(ofSize: 18, weight: .bold))
            .foregroundColor(.label)
            .textAligned(.center)

        $followerCount
            .map { count -> String? in
                count >= 100_000 ? String(format: "%.1fK", Double(count) / 1000) : "\(count)"
            }
            .observe(on: MainScheduler.instance)
            .bind(to: followerLabel.rx.text)
            .disposed(by: disposeBag)

        let followLabel = Text("Follow")
            .font(UIFont.systemFont(ofSize: 15, weight: .semibold))
            .foregroundColor(.white)
            .textAligned(.center)

        let followBackground = UIView()
            .background(.systemBlue)
            .frame(height: 40)
            .cornerRadius(20)

        view.addSubviewWithFit(
            ScrollView(.vertical, showsIndicators: false) {
                VStack(spacing: 0) {
                    ZStack {
                        heroImageView
                        LinearGradient(
                            gradient: Gradient(colors: [.clear, UIColor.systemBackground.withAlphaComponent(0.95)]),
                            startPoint: UnitPoint(x: 0.5, y: 0.5),
                            endPoint: .bottom
                        )
                    }
                    .frame(height: 260)
                    .overlay(alignment: .bottomLeading, view:
                        avatarImageView
                            .padding(.init(top: 0, left: 20, bottom: 12, right: 0))
                    )

                    VStack(spacing: 20) {
                        HStack(alignment: .center) {
                            VStack(alignment: .leading, spacing: 4) {
                                Text("Alex Morgan")
                                    .font(UIFont.systemFont(ofSize: 20, weight: .bold))
                                    .foregroundColor(.label)
                                Text("@alexmorgan · Product Designer")
                                    .font(UIFont.systemFont(ofSize: 14, weight: .regular))
                                    .foregroundColor(.secondaryLabel)
                            }
                            Spacer()
                            Button(action: { [weak self, weak followLabel, weak followBackground] in
                                guard let self = self else { return }
                                self.isFollowing.toggle()
                                self.followerCount += self.isFollowing ? 1 : -1
                                followLabel?.text = self.isFollowing ? "Following ✓" : "Follow"
                                followBackground?.backgroundColor = self.isFollowing ? .systemGray4 : .systemBlue
                            }) {
                                ZStack {
                                    followBackground
                                    followLabel.padding(.horizontal, 24)
                                }
                                .frame(width: 130, height: 40)
                            }
                        }

                        Text("Designing products that people love. Based in San Francisco. Open to new opportunities ✨")
                            .font(UIFont.systemFont(ofSize: 15, weight: .regular))
                            .foregroundColor(.label)
                            .lineLimit(3)

                        // Stats: ZStack overlays thin dividers on top of the 3-column equal-width HStack
                        ZStack {
                            HStack(spacing: 0) {
                                statView(label: followerLabel, title: "Followers")
                                statView(
                                    label: Text("482")
                                        .font(UIFont.systemFont(ofSize: 18, weight: .bold))
                                        .textAligned(.center),
                                    title: "Following"
                                )
                                statView(
                                    label: Text("128")
                                        .font(UIFont.systemFont(ofSize: 18, weight: .bold))
                                        .textAligned(.center),
                                    title: "Posts"
                                )
                            }
                            .distributed(.fillEqually)

                            // Thin dividers at 1/3 and 2/3 marks via equal Spacers
                            HStack(spacing: 0) {
                                Spacer()
                                UIView()
                                    .background(.systemGray4)
                                    .frame(width: 1)
                                    .padding(.vertical, 12)
                                Spacer()
                                UIView()
                                    .background(.systemGray4)
                                    .frame(width: 1)
                                    .padding(.vertical, 12)
                                Spacer()
                            }
                        }
                        .background(.systemGray6)
                        .cornerRadius(16)

                        HStack(alignment: .center) {
                            Text("Notifications")
                                .font(UIFont.systemFont(ofSize: 16, weight: .medium))
                                .foregroundColor(.label)
                            Spacer()
                            UISwitch()
                                .isOn(false)
                                .onTintColor(.systemBlue)
                        }
                        .padding(.horizontal, 16)
                        .padding(.vertical, 12)
                        .background(.systemGray6)
                        .cornerRadius(12)

                        photoGrid()
                    }
                    .padding(.all, 20)
                }
            }
        )
    }

    private func statView(label: UILabel, title: String) -> UIView {
        VStack(alignment: .center, spacing: 4) {
            label
            Text(title)
                .font(UIFont.systemFont(ofSize: 12, weight: .regular))
                .foregroundColor(.secondaryLabel)
                .textAligned(.center)
        }
        .padding(.vertical, 16)
        .padding(.horizontal, 8)
    }

    private func photoGrid() -> UIView {
        let seeds = [22, 23, 24, 25, 26, 27]
        let size = (UIScreen.main.bounds.width - 40 - 4) / 3

        return VStack(spacing: 2) {
            [0, 3].map { row -> UIView in
                HStack(spacing: 2) {
                    [row, row + 1, row + 2].map { idx -> UIView in
                        let iv = Image(nil)
                            .makeContentMode(.scaleAspectFill)
                            .frame(width: size, height: size)
                            .masksToBounds(true)
                        iv.loadRemote(seed: seeds[idx], width: Int(size * 2), height: Int(size * 2))
                        return iv
                    }
                }
            }
        }
    }
}
