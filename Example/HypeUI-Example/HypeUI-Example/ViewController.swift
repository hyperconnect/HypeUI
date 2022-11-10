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

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        view.addSubviewWithFit(
            ScrollView(.vertical, showsIndicators: false) {
                VStack(spacing: 10) {
                    Text("Text")
                        .font(UIFont.systemFont(ofSize: 32, weight: .heavy))
                    Spacer()
                        .background(.systemGray5)
                        .frame(height: 1)
                    Text("Heading 1")
                        .font(UIFont.systemFont(ofSize: 32, weight: .bold))
                        .foregroundColor(UIColor.black)
                    Text("Heading 2")
                        .font(UIFont.systemFont(ofSize: 24, weight: .bold))
                    Text("Heading 3")
                        .font(UIFont.systemFont(ofSize: 16, weight: .bold))
                    Text("Heavy")
                        .font(UIFont.systemFont(ofSize: 16, weight: .heavy))
                    Text("Bold")
                        .font(UIFont.systemFont(ofSize: 16, weight: .bold))
                    Text("Regular")
                        .font(UIFont.systemFont(ofSize: 16, weight: .regular))
                    Text("Light")
                        .font(UIFont.systemFont(ofSize: 16, weight: .light))
                    Text("Alignement Center")
                        .font(UIFont.systemFont(ofSize: 16, weight: .light))
                        .textAligned(.center)
                    Text("🌺 HypeUI is a implementation of Apple's SwiftUI DSL style based on UIKit")
                        .font(UIFont.systemFont(ofSize: 16, weight: .regular))
                        .foregroundColor(UIColor.systemGray)
                        .lineLimit(3)
                    Spacer()
                        .frame(height: 64)
                    Text("Button")
                        .font(UIFont.systemFont(ofSize: 32, weight: .heavy))
                    Spacer()
                        .background(.systemGray5)
                        .frame(height: 1)
                    Button(action: { print("🐠 Click Me!!") }) {
                        Text("🐠 Click Me!!")
                            .font(UIFont.systemFont(ofSize: 16, weight: .bold ))
                            .foregroundColor(UIColor.white)
                            .textAligned(.center)
                            .padding(.horizontal, 24)
                            .frame(height: 48)
                            .background(.systemYellow)
                            .cornerRadius(24)
                    }.padding(.horizontal, 64)
                    Button(action: { print("Border Button") }) {
                        Text("Border Button")
                            .font(UIFont.systemFont(ofSize: 16, weight: .bold ))
                            .foregroundColor(UIColor.black)
                            .textAligned(.center)
                            .padding(.horizontal, 24)
                            .frame(height: 48)
                            .background(UIColor.white)
                            .border(UIColor.black, width: 2)
                            .cornerRadius(24)
                    }.padding(.horizontal, 64)
                    Button(action: { print("Stack Button")}) {
                        ZStack {
                            UIView()
                                .background(.systemBlue)
                                .frame(height: 48)
                                .cornerRadius(24)
                            HStack(alignment: .center) {
                                VStack(alignment: .center, spacing: 1) {
                                    Text("Stack Button")
                                        .font(UIFont.systemFont(ofSize: 16, weight: .bold))
                                        .foregroundColor(UIColor.white)
                                    HStack(alignment: .center, spacing: 2) {
                                        Text("🌎")
                                            .font(UIFont.systemFont(ofSize: 12, weight: .medium))
                                        Text("Earth")
                                            .font(UIFont.systemFont(ofSize: 14, weight: .medium))
                                            .foregroundColor(UIColor.white)
                                    }
                                }
                            }
                        }
                    }.padding(.horizontal, 64)
                    Spacer()
                        .frame(height: 64)
                    Text("ScrollView")
                        .font(UIFont.systemFont(ofSize: 32, weight: .heavy))
                    Spacer()
                        .background(.systemGray5)
                        .frame(height: 1)
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack(alignment: .center, spacing: 8) {
                            ["Proactive", "One Team", "Aim High", "Priortize", "Move Fast", "Logical", "Open"].map {
                                Text($0)
                                    .font(UIFont.systemFont(ofSize: 18, weight: .bold))
                                    .foregroundColor(UIColor.black)
                                    .textAligned(.center)
                                    .background(.systemGray6)
                                    .frame(width: 140, height: 64)
                                    .cornerRadius(32)
                            }
                        }
                    }
                    Spacer()
                        .frame(height: 64)
                    Text("View Modifier")
                        .font(UIFont.systemFont(ofSize: 32, weight: .heavy))
                    Spacer()
                        .background(.systemGray5)
                        .frame(height: 1)
                    Text("Padding")
                        .foregroundColor(UIColor.white)
                        .textAligned(.center)
                        .font(UIFont.systemFont(ofSize: 14, weight: .bold))
                        .padding(.all, 12)
                        .background(UIColor.systemRed)
                        .padding(.all, 12)
                        .background(UIColor.systemOrange)
                        .padding(.all, 12)
                        .background(UIColor.systemYellow)
                        .padding(.all, 12)
                        .background(UIColor.systemGreen)
                        .padding(.all, 12)
                        .background(UIColor.systemBlue)
                        .padding(.all, 12)
                        .background(UIColor.systemIndigo)
                        .padding(.all, 12)
                        .background(UIColor.systemPurple)
                    Text("Border")
                        .foregroundColor(UIColor.white)
                        .textAligned(.center)
                        .font(UIFont.systemFont(ofSize: 14, weight: .bold))
                        .padding(.all, 12)
                        .background(UIColor.systemGray)
                        .border(UIColor.black, width: 2)
                }
                .padding(.all, 24)
            }
        )
    }
}
