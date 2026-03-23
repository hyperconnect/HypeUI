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

import HypeUI
import UIKit

// MARK: - ConceptListViewController

final class ConceptListViewController: UIViewController {

    private struct Concept {
        let title: String
        let subtitle: String
        let picsumSeed: Int
        let makeVC: () -> UIViewController
    }

    private let concepts: [Concept] = [
        Concept(title: "Music Player",      subtitle: "Slider · ProgressView · Switch · PageControl", picsumSeed: 10, makeVC: MusicPlayerViewController.init),
        Concept(title: "Social Profile",    subtitle: "Overlay · ZStack · LinearGradient · Behavior",  picsumSeed: 20, makeVC: SocialProfileViewController.init),
        Concept(title: "Settings",          subtitle: "Switch · Slider · Stepper · ActivityIndicator", picsumSeed: 30, makeVC: SettingsViewController.init),
        Concept(title: "Travel Carousel",   subtitle: "ScrollView · PageControl · ZStack",             picsumSeed: 40, makeVC: TravelCarouselViewController.init),
        Concept(title: "Component Gallery", subtitle: "Text · Button · Gradient · Border",             picsumSeed: 50, makeVC: ComponentGalleryViewController.init),
        Concept(title: "Animation",         subtitle: "opacity · scaleEffect · rotationEffect",        picsumSeed: 60, makeVC: AnimationShowcaseViewController.init),
    ]

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "HypeUI"
        view.backgroundColor = .systemBackground

        let imageViews: [UIImageView] = concepts.map { _ in
            Image(nil)
                .makeContentMode(.scaleAspectFill)
                .frame(height: 160)
                .background(.systemGray5)
                .masksToBounds(true)
        }

        view.addSubviewWithFit(
            ScrollView(.vertical, showsIndicators: false) {
                VStack(spacing: 16) {
                    concepts.enumerated().map { index, concept -> UIView in
                        let iv = imageViews[index]
                        return Button(action: { [weak self] in
                            self?.navigationController?.pushViewController(concept.makeVC(), animated: true)
                        }) {
                            ZStack {
                                iv
                                LinearGradient(
                                    gradient: Gradient(colors: [.clear, UIColor.black.withAlphaComponent(0.65)]),
                                    startPoint: .top,
                                    endPoint: .bottom
                                )
                                VStack(alignment: .leading, spacing: 6) {
                                    Spacer()
                                    Text(concept.title)
                                        .font(UIFont.systemFont(ofSize: 20, weight: .bold))
                                        .foregroundColor(.white)
                                    Text(concept.subtitle)
                                        .font(UIFont.systemFont(ofSize: 13, weight: .medium))
                                        .foregroundColor(UIColor.white.withAlphaComponent(0.75))
                                        .lineLimit(1)
                                }
                                .padding(.all, 16)
                            }
                            .cornerRadius(16)
                            .masksToBounds(true)
                        }
                    }
                }
                .padding(.all, 20)
            }
        )

        concepts.enumerated().forEach { index, concept in
            imageViews[index].loadRemote(seed: concept.picsumSeed, width: 800, height: 320)
        }
    }
}
