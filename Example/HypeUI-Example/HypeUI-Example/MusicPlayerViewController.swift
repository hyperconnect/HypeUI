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

// MARK: - MusicPlayerViewController

final class MusicPlayerViewController: UIViewController {

    @Behavior var isPlaying = false
    @Behavior var currentTrack = 0
    @Behavior var progress: Float = 0.0
    @Behavior var volume: Float = 0.75
    @Behavior var isShuffle = false

    private let tracks: [(title: String, artist: String, duration: Int)] = [
        ("Midnight Dreams",    "Luna Ray",      225),
        ("Ocean Waves",        "The Drifters",  198),
        ("Golden Hour",        "Sunbeam",       241),
        ("Starlight Serenade", "Nova Cole",     213),
        ("Neon City",          "Electric Echo", 187),
    ]

    private let heroHeight: CGFloat = 320
    private var pagingScrollView: UIScrollView!
    private var timer: Timer?
    private let disposeBag = DisposeBag()

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Music Player"
        view.backgroundColor = .black

        let screenWidth = UIScreen.main.bounds.width

        // ── Horizontal paging hero ───────────────────────────────────────────
        pagingScrollView = UIScrollView()
        pagingScrollView.isPagingEnabled = true
        pagingScrollView.showsHorizontalScrollIndicator = false
        pagingScrollView.showsVerticalScrollIndicator = false
        pagingScrollView.bounces = false
        pagingScrollView.delegate = self

        for i in 0..<tracks.count {
            let iv = UIImageView()
            iv.contentMode = .scaleAspectFill
            iv.clipsToBounds = true
            iv.frame = CGRect(x: CGFloat(i) * screenWidth, y: 0, width: screenWidth, height: heroHeight)
            iv.loadRemote(seed: 10 + i, width: Int(screenWidth * 2), height: Int(heroHeight * 2))

            let gradient = CAGradientLayer()
            gradient.colors = [UIColor.clear.cgColor, UIColor.black.cgColor]
            gradient.startPoint = CGPoint(x: 0.5, y: 0.3)
            gradient.endPoint = CGPoint(x: 0.5, y: 1.0)
            gradient.frame = CGRect(x: 0, y: 0, width: screenWidth, height: heroHeight)
            iv.layer.addSublayer(gradient)

            pagingScrollView.addSubview(iv)
        }
        pagingScrollView.contentSize = CGSize(
            width: screenWidth * CGFloat(tracks.count),
            height: heroHeight
        )

        // ── Labels ───────────────────────────────────────────────────────────
        let trackTitleLabel = Text(tracks[0].title)
            .font(UIFont.systemFont(ofSize: 22, weight: .bold))
            .foregroundColor(.white)
            .textAligned(.center)

        let artistLabel = Text(tracks[0].artist)
            .font(UIFont.systemFont(ofSize: 16, weight: .regular))
            .foregroundColor(UIColor.white.withAlphaComponent(0.7))
            .textAligned(.center)

        let currentTimeLabel = Text("0:00")
            .font(UIFont.systemFont(ofSize: 11, weight: .regular))
            .foregroundColor(UIColor.white.withAlphaComponent(0.5))

        let totalTimeLabel = Text(formatTime(tracks[0].duration))
            .font(UIFont.systemFont(ofSize: 11, weight: .regular))
            .foregroundColor(UIColor.white.withAlphaComponent(0.5))

        let playLabel = Text("▶")
            .font(UIFont.systemFont(ofSize: 30, weight: .bold))
            .foregroundColor(.black)
            .textAligned(.center)
            .frame(width: 64, height: 64)
            .background(.white)
            .cornerRadius(32)

        // ── Page control ─────────────────────────────────────────────────────
        let pageControl = UIPageControl()
            .numberOfPages(tracks.count)
            .currentPage(currentTrack)
            .pageIndicatorTintColor(UIColor.white.withAlphaComponent(0.3))
            .currentPageIndicatorTintColor(.white)
            .linked($currentTrack, keyPath: \.currentPage)
            .onChange { [weak self] page in
                guard let self = self else { return }
                self.currentTrack = page
                self.progress = 0
                let x = CGFloat(page) * UIScreen.main.bounds.width
                self.pagingScrollView?.setContentOffset(CGPoint(x: x, y: 0), animated: true)
            }
        // ── Bindings ─────────────────────────────────────────────────────────
        $currentTrack
            .map { [weak self] idx -> String? in self?.tracks[idx].title }
            .observe(on: MainScheduler.instance)
            .bind(to: trackTitleLabel.rx.text)
            .disposed(by: disposeBag)

        $currentTrack
            .map { [weak self] idx -> String? in self?.tracks[idx].artist }
            .observe(on: MainScheduler.instance)
            .bind(to: artistLabel.rx.text)
            .disposed(by: disposeBag)

        $currentTrack
            .map { [weak self] idx -> String? in
                guard let self = self else { return nil }
                return self.formatTime(self.tracks[idx].duration)
            }
            .observe(on: MainScheduler.instance)
            .bind(to: totalTimeLabel.rx.text)
            .disposed(by: disposeBag)

        $progress
            .map { [weak self] p -> String? in
                guard let self = self else { return nil }
                let elapsed = Int(p * Float(self.tracks[self.currentTrack].duration))
                return self.formatTime(elapsed)
            }
            .observe(on: MainScheduler.instance)
            .bind(to: currentTimeLabel.rx.text)
            .disposed(by: disposeBag)

        $isPlaying
            .map { $0 ? "⏸" : "▶" }
            .observe(on: MainScheduler.instance)
            .bind(to: playLabel.rx.text)
            .disposed(by: disposeBag)

        // ── Layout ───────────────────────────────────────────────────────────
        view.addSubviewWithFit(
            VStack(spacing: 0) {
                // Hero paging scroll view (height fixed)
                pagingScrollView.frame(height: heroHeight)

                // Controls — vertically scrollable for overflow
                ScrollView(.vertical, showsIndicators: false) {
                    VStack(spacing: 0) {
                        VStack(spacing: 28) {
                            pageControl

                            VStack(alignment: .center, spacing: 8) {
                                trackTitleLabel
                                artistLabel
                            }

                            VStack(spacing: 8) {
                                UIProgressView()
                                    .progressViewStyle(.default)
                                    .progressTintColor(.white)
                                    .trackTintColor(UIColor.white.withAlphaComponent(0.2))
                                    .linked($progress, keyPath: \.progress)
                                HStack {
                                    currentTimeLabel
                                    Spacer()
                                    totalTimeLabel
                                }
                            }

                            HStack(alignment: .center, spacing: 44) {
                                Button(action: { [weak self] in self?.previousTrack() }) {
                                    Text("⏮")
                                        .font(UIFont.systemFont(ofSize: 26))
                                        .textAligned(.center)
                                        .frame(width: 48, height: 48)
                                }
                                Button(action: { [weak self] in self?.togglePlayback() }) {
                                    playLabel
                                }
                                Button(action: { [weak self] in self?.nextTrack() }) {
                                    Text("⏭")
                                        .font(UIFont.systemFont(ofSize: 26))
                                        .textAligned(.center)
                                        .frame(width: 48, height: 48)
                                }
                            }
                        }

                        Spacer()

                        VStack(spacing: 20) {
                            HStack(alignment: .center, spacing: 12) {
                                Text("🔈")
                                    .font(UIFont.systemFont(ofSize: 16))
                                    .fixedSize()
                                UISlider()
                                    .value(volume)
                                    .minimumValue(0)
                                    .maximumValue(1)
                                    .minimumTrackTintColor(.white)
                                    .maximumTrackTintColor(UIColor.white.withAlphaComponent(0.3))
                                    .thumbTintColor(.white)
                                    .linked($volume, keyPath: \.value)
                                    .onChange { [weak self] v in self?.volume = v }
                                Text("🔊")
                                    .font(UIFont.systemFont(ofSize: 16))
                                    .fixedSize()
                            }

                            HStack(alignment: .center) {
                                Text("Shuffle")
                                    .font(UIFont.systemFont(ofSize: 16, weight: .medium))
                                    .foregroundColor(.white)
                                Spacer()
                                UISwitch()
                                    .isOn(isShuffle)
                                    .onTintColor(.systemBlue)
                                    .linked($isShuffle, keyPath: \.isOn)
                                    .onChange { [weak self] on in self?.isShuffle = on }
                            }
                        }
                    }
                    .padding(.horizontal, 28)
                    .padding(.vertical, 28)
                }
            }
        )
    }

    // MARK: - Playback

    private func togglePlayback() {
        isPlaying.toggle()
        if isPlaying {
            let t = Timer(timeInterval: 0.1, repeats: true) { [weak self] _ in
                guard let self = self else { return }
                let duration = Float(self.tracks[self.currentTrack].duration)
                if self.progress < 1.0 {
                    self.progress = min(1.0, self.progress + (0.1 / duration))
                } else {
                    self.nextTrack()
                }
            }
            RunLoop.current.add(t, forMode: .common)
            timer = t
        } else {
            timer?.invalidate()
            timer = nil
        }
    }

    private func nextTrack() {
        progress = 0
        currentTrack = isShuffle
            ? (0..<tracks.count).filter { $0 != currentTrack }.randomElement() ?? (currentTrack + 1) % tracks.count
            : (currentTrack + 1) % tracks.count
        scrollToCurrentTrack(animated: true)
    }

    private func previousTrack() {
        progress = 0
        currentTrack = (currentTrack - 1 + tracks.count) % tracks.count
        scrollToCurrentTrack(animated: true)
    }

    private func scrollToCurrentTrack(animated: Bool) {
        let x = CGFloat(currentTrack) * UIScreen.main.bounds.width
        pagingScrollView?.setContentOffset(CGPoint(x: x, y: 0), animated: animated)
    }

    private func formatTime(_ seconds: Int) -> String {
        "\(seconds / 60):\(String(format: "%02d", seconds % 60))"
    }

    deinit {
        timer?.invalidate()
    }
}

// MARK: - UIScrollViewDelegate

extension MusicPlayerViewController: UIScrollViewDelegate {
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        guard scrollView == pagingScrollView else { return }
        let page = Int(scrollView.contentOffset.x / UIScreen.main.bounds.width + 0.5)
        if page != currentTrack {
            progress = 0
            currentTrack = page
        }
    }
}
