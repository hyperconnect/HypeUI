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

// MARK: - TravelCarouselViewController

final class TravelCarouselViewController: UIViewController {

    private struct Destination {
        let name: String
        let country: String
        let description: String
        let seed: Int
    }

    private let destinations: [Destination] = [
        Destination(name: "Santorini",    country: "🇬🇷 Greece",   description: "Iconic white-washed villages perched above the Aegean Sea.", seed: 40),
        Destination(name: "Kyoto",        country: "🇯🇵 Japan",    description: "Ancient temples, bamboo forests and traditional tea houses.", seed: 41),
        Destination(name: "Amalfi Coast", country: "🇮🇹 Italy",    description: "Dramatic cliffs, colorful villages and azure Mediterranean waters.", seed: 42),
        Destination(name: "Patagonia",    country: "🇦🇷 Argentina", description: "Wild mountains, glaciers and untouched landscapes at the end of the world.", seed: 43),
        Destination(name: "Bali",         country: "🇮🇩 Indonesia", description: "Lush rice terraces, spiritual temples and vibrant surf culture.", seed: 44),
    ]

    private let cardWidth: CGFloat = UIScreen.main.bounds.width - 48
    private var carouselScrollView: UIScrollView?
    private weak var pageControl: UIPageControl?

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Travel Carousel"
        view.backgroundColor = .systemBackground

        let cards: [UIView] = destinations.map { dest in
            let iv = Image(nil)
                .makeContentMode(.scaleAspectFill)
                .frame(height: 320)
                .masksToBounds(true)
            iv.loadRemote(seed: dest.seed, width: Int(cardWidth * 2), height: 640)

            return ZStack {
                iv
                LinearGradient(
                    gradient: Gradient(colors: [.clear, UIColor.black.withAlphaComponent(0.75)]),
                    startPoint: UnitPoint(x: 0.5, y: 0.3),
                    endPoint: .bottom
                )
                VStack(alignment: .leading, spacing: 6) {
                    Spacer()
                    Text(dest.name)
                        .font(UIFont.systemFont(ofSize: 28, weight: .bold))
                        .foregroundColor(.white)
                    Text(dest.country)
                        .font(UIFont.systemFont(ofSize: 15, weight: .semibold))
                        .foregroundColor(UIColor.white.withAlphaComponent(0.9))
                    Text(dest.description)
                        .font(UIFont.systemFont(ofSize: 13, weight: .regular))
                        .foregroundColor(UIColor.white.withAlphaComponent(0.75))
                        .lineLimit(2)
                }
                .padding(.all, 20)
            }
            .cornerRadius(20)
            .masksToBounds(true)
            .frame(width: cardWidth)
        }

        let pageCtrl = UIPageControl()
            .numberOfPages(destinations.count)
            .currentPage(0)
            .pageIndicatorTintColor(.systemGray3)
            .currentPageIndicatorTintColor(.systemBlue)
            .onChange { [weak self] page in
                guard let scrollView = self?.carouselScrollView, let self = self else { return }
                let offset = CGFloat(page) * (self.cardWidth + 16)
                scrollView.setContentOffset(CGPoint(x: offset, y: 0), animated: true)
            }
        pageControl = pageCtrl

        let scrollView = ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 16) {
                cards.map { $0 as ViewBuildable }
            }
            .padding(.horizontal, 24)
        }
        .decelerationRate(.fast)
        .alwaysBounceHorizontal(true)
        carouselScrollView = scrollView
        scrollView.delegate = self

        view.addSubviewWithFit(
            ScrollView(.vertical, showsIndicators: false) {
                VStack(spacing: 0) {
                    VStack(alignment: .leading, spacing: 4) {
                        Text("Discover the World")
                            .font(UIFont.systemFont(ofSize: 26, weight: .bold))
                            .foregroundColor(.label)
                        Text("Hand-picked destinations for your next adventure")
                            .font(UIFont.systemFont(ofSize: 15, weight: .regular))
                            .foregroundColor(.secondaryLabel)
                    }
                    .padding(.all, 24)

                    scrollView.frame(height: 340)

                    pageCtrl.padding(.vertical, 12)

                    VStack(alignment: .leading, spacing: 16) {
                        Text("Why Travel?")
                            .font(UIFont.systemFont(ofSize: 20, weight: .bold))
                            .foregroundColor(.label)
                        Text("Traveling broadens the mind, enriches the soul, and creates memories that last a lifetime. Every destination has a unique story to tell — from ancient civilizations to breathtaking natural landscapes.")
                            .font(UIFont.systemFont(ofSize: 15, weight: .regular))
                            .foregroundColor(.secondaryLabel)
                            .lineLimit(0)
                    }
                    .padding(.all, 24)
                }
            }
        )
    }
}

// MARK: - UIScrollViewDelegate

extension TravelCarouselViewController: UIScrollViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        guard scrollView == carouselScrollView else { return }
        let pageWidth = cardWidth + 16
        let page = Int((scrollView.contentOffset.x + pageWidth / 2) / pageWidth)
        pageControl?.currentPage = max(0, min(page, destinations.count - 1))
    }
}
