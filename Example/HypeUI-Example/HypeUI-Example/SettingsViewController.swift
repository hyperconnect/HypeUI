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
import RxCocoa

// MARK: - SettingsViewController

final class SettingsViewController: UIViewController {

    @Behavior var darkMode = false
    @Behavior var notifications = true
    @Behavior var brightness: Float = 0.70
    @Behavior var fontSize: Double = 16.0
    @Behavior var storageUsed: Float = 0.65
    @Behavior var isSyncing = false

    private let disposeBag = DisposeBag()

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Settings"
        view.backgroundColor = .systemGroupedBackground

        let brightnessLabel = Text("70%")
            .font(UIFont.systemFont(ofSize: 14, weight: .medium))
            .foregroundColor(.secondaryLabel)
            .setHContentHugging(priority: .required)

        $brightness
            .map { "\(Int($0 * 100))%" as String? }
            .observe(on: MainScheduler.instance)
            .bind(to: brightnessLabel.rx.text)
            .disposed(by: disposeBag)

        let fontSizeLabel = Text("16")
            .font(UIFont.systemFont(ofSize: 16, weight: .regular))
            .foregroundColor(.label)
            .textAligned(.center)
            .frame(width: 32)

        $fontSize
            .map { "\(Int($0))" as String? }
            .observe(on: MainScheduler.instance)
            .bind(to: fontSizeLabel.rx.text)
            .disposed(by: disposeBag)

        let storageLabel = Text("65% used")
            .font(UIFont.systemFont(ofSize: 13, weight: .medium))
            .foregroundColor(.secondaryLabel)
            .setHContentHugging(priority: .required)

        $storageUsed
            .map { "\(Int($0 * 100))% used" as String? }
            .observe(on: MainScheduler.instance)
            .bind(to: storageLabel.rx.text)
            .disposed(by: disposeBag)

        let syncIndicator = UIActivityIndicatorView(style: .medium)
            .hidesWhenStopped(true)
            .color(.systemBlue)

        $isSyncing
            .observe(on: MainScheduler.instance)
            .bind(to: syncIndicator.rx.isAnimating)
            .disposed(by: disposeBag)

        view.addSubviewWithFit(
            ScrollView(.vertical, showsIndicators: false) {
                VStack(spacing: 0) {
                    sectionHeader("Appearance")
                    settingCard {
                        VStack(spacing: 0) {
                            settingRow {
                                Text("Dark Mode")
                                    .font(UIFont.systemFont(ofSize: 16, weight: .regular))
                                    .foregroundColor(.label)
                                Spacer()
                                UISwitch()
                                    .isOn(darkMode)
                                    .onTintColor(.systemBlue)
                                    .linked($darkMode, keyPath: \.isOn)
                                    .onChange { [weak self] on in self?.darkMode = on }
                            }
                            divider()
                            // Brightness row: label+% on top, slider below (fill alignment fixes slider touch)
                            settingRow {
                                VStack(spacing: 10) {
                                    HStack(alignment: .center, spacing: 12) {
                                        Text("Brightness")
                                            .font(UIFont.systemFont(ofSize: 16, weight: .regular))
                                            .foregroundColor(.label)
                                        Spacer()
                                        brightnessLabel
                                    }
                                    UISlider()
                                        .value(brightness)
                                        .minimumValue(0)
                                        .maximumValue(1)
                                        .minimumTrackTintColor(.systemBlue)
                                        .linked($brightness, keyPath: \.value)
                                        .onChange { [weak self] v in self?.brightness = v }
                                }
                            }
                        }
                    }

                    sectionHeader("Notifications")
                    settingCard {
                        settingRow {
                            Text("Push Notifications")
                                .font(UIFont.systemFont(ofSize: 16, weight: .regular))
                                .foregroundColor(.label)
                            Spacer()
                            UISwitch()
                                .isOn(notifications)
                                .onTintColor(.systemGreen)
                                .linked($notifications, keyPath: \.isOn)
                                .onChange { [weak self] on in self?.notifications = on }
                        }
                    }

                    sectionHeader("Text")
                    settingCard {
                        settingRow {
                            Text("Font Size")
                                .font(UIFont.systemFont(ofSize: 16, weight: .regular))
                                .foregroundColor(.label)
                            Spacer()
                            HStack(alignment: .center, spacing: 12) {
                                fontSizeLabel
                                UIStepper()
                                    .value(fontSize)
                                    .minimumValue(10)
                                    .maximumValue(28)
                                    .stepValue(1)
                                    .onChange { [weak self] v in self?.fontSize = v }
                            }
                        }
                    }

                    sectionHeader("Storage")
                    settingCard {
                        settingRow {
                            VStack(spacing: 10) {
                                HStack(alignment: .center, spacing: 12) {
                                    Text("Local Storage")
                                        .font(UIFont.systemFont(ofSize: 16, weight: .regular))
                                        .foregroundColor(.label)
                                    Spacer()
                                    storageLabel
                                }
                                UIProgressView()
                                    .progressTintColor(.systemOrange)
                                    .trackTintColor(.systemGray5)
                                    .linked($storageUsed, keyPath: \.progress)
                            }
                        }
                    }

                    sectionHeader("Sync")
                    settingCard {
                        VStack(spacing: 0) {
                            settingRow {
                                Text("iCloud Sync")
                                    .font(UIFont.systemFont(ofSize: 16, weight: .regular))
                                    .foregroundColor(.label)
                                Spacer()
                                syncIndicator
                            }
                            divider()
                            Button(action: { [weak self] in
                                guard let self = self else { return }
                                self.isSyncing = true
                                DispatchQueue.main.asyncAfter(deadline: .now() + 2.5) { [weak self] in
                                    self?.isSyncing = false
                                }
                            }) {
                                Text("Sync Now")
                                    .font(UIFont.systemFont(ofSize: 16, weight: .semibold))
                                    .foregroundColor(.systemBlue)
                                    .textAligned(.center)
                                    .padding(.vertical, 14)
                            }
                        }
                    }

                    Spacer().frame(height: 32)
                }
            }
        )
    }

    private func sectionHeader(_ title: String) -> UIView {
        Text(title.uppercased())
            .font(UIFont.systemFont(ofSize: 13, weight: .semibold))
            .foregroundColor(.secondaryLabel)
            .padding(.init(top: 24, left: 20, bottom: 8, right: 20))
    }

    private func settingCard(@ViewArrayBuilder _ content: () -> [UIView]) -> UIView {
        VStack(spacing: 0) {
            content()
        }
        .background(.secondarySystemGroupedBackground)
        .cornerRadius(12)
        .padding(.horizontal, 16)
    }

    private func settingRow(@ViewArrayBuilder _ content: () -> [UIView]) -> UIView {
        HStack(alignment: .center, spacing: 8) {
            content()
        }
        .padding(.horizontal, 16)
        .padding(.vertical, 14)
    }

    private func divider() -> UIView {
        Spacer()
            .frame(height: 1)
            .background(.separator)
            .padding(.leading, 16)
    }
}
