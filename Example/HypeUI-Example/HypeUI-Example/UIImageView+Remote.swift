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

extension UIImageView {
    /// Loads an image asynchronously from Lorem Picsum using a seed for consistent results.
    /// - Parameters:
    ///   - seed: Seed string for a consistent image.
    ///   - width: Desired image width in pixels.
    ///   - height: Desired image height in pixels.
    func loadRemote(seed: Int, width: Int = 400, height: Int = 300) {
        guard let url = URL(string: "https://picsum.photos/seed/\(seed)/\(width)/\(height)") else { return }
        URLSession.shared.dataTask(with: url) { [weak self] data, _, _ in
            guard let data = data, let image = UIImage(data: data) else { return }
            DispatchQueue.main.async { self?.image = image }
        }.resume()
    }
}
