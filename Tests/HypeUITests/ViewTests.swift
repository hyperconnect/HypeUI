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

import XCTest
import UIKit

// MARK: - ViewTests

@testable import HypeUI
final class ViewTests: XCLayoutTestCase {

    func testPaddingWithUIEdgeInsets() {
        // given
        let sut = HStack(spacing: 5) {
            Image()
                .frame(width: 20, height: 20)
            Text()
                .frame(width: 100, height: 20)
        }.padding(UIEdgeInsets(top: 10, left: 20, bottom: 10, right: 20))

        contentView.addSubviewWithFit(
            VStack(alignment: .center) {
                sut
                Spacer()
            }
        )
        contentView.layoutIfNeeded()

        // then
        XCTAssertEqual(sut.frame.size, CGSize(width: 20 + 125 + 20, height: 10 + 20 + 10))
        XCTAssertEqual(sut.frame.midX, sut.frame.midX)

        // https://github.com/SnapKit/SnapKit/blob/develop/Tests/SnapKitTests/Tests.swift#L95
        XCTAssertNotNil(sut.constraints.first { $0.firstAttribute == .leading && $0.secondAttribute == .leading })
        XCTAssertNotNil(sut.constraints.first { $0.firstAttribute == .trailing && $0.secondAttribute == .trailing })
        XCTAssertNotNil(sut.constraints.first { $0.firstAttribute == .top && $0.secondAttribute == .top })
        XCTAssertNotNil(sut.constraints.first { $0.firstAttribute == .bottom && $0.secondAttribute == .bottom })
    }

    func testPaddingWithEdges() {
        // given
        let sut = HStack(spacing: 5) {
            Image()
                .frame(width: 20, height: 20)
            Text()
                .frame(width: 100, height: 20)
        }.padding(.all, 20)

        contentView.addSubviewWithFit(
            VStack(alignment: .center) {
                sut
                Spacer()
            }
        )
        contentView.layoutIfNeeded()

        // then
        XCTAssertEqual(sut.frame.size, CGSize(width: 20 + 125 + 20, height: 20 + 20 + 20))
        XCTAssertEqual(sut.frame.midX, sut.frame.midX)

        // https://github.com/SnapKit/SnapKit/blob/develop/Tests/SnapKitTests/Tests.swift#L95
        XCTAssertNotNil(sut.constraints.first { $0.firstAttribute == .leading && $0.secondAttribute == .leading })
        XCTAssertNotNil(sut.constraints.first { $0.firstAttribute == .trailing && $0.secondAttribute == .trailing })
        XCTAssertNotNil(sut.constraints.first { $0.firstAttribute == .top && $0.secondAttribute == .top })
        XCTAssertNotNil(sut.constraints.first { $0.firstAttribute == .bottom && $0.secondAttribute == .bottom })
    }

    func testFrameWidth() {
        // given
        var sut = Spacer()

        // when
        sut = sut.frame(width: 10)

        // then
        XCTAssertNotNil(sut.constraints.first { $0.firstAttribute == .width && $0.constant == 10 })
        XCTAssertNil(sut.constraints.first { $0.firstAttribute == .height })
    }

    func testFrameHeight() {
        // given
        var sut = Spacer()

        // when
        sut = sut.frame(height: 10)

        // then
        XCTAssertNotNil(sut.constraints.first { $0.firstAttribute == .height && $0.constant == 10 })
        XCTAssertNil(sut.constraints.first { $0.firstAttribute == .width })
    }

    func testStackDistributedToEqual() {
        // given
        let sut = HStack(alignment: .center) {
            Text("🌺 Hello")
                .font(UIFont.systemFont(ofSize: 20, weight: .bold))
            Text("🦄 HypeUI")
                .font(UIFont.systemFont(ofSize: 16, weight: .regular))
            ScrollView(.vertical) {
                Text("Scrolling...")
                    .font(UIFont.systemFont(ofSize: 14, weight: .heavy))
            }
        }

        // when
        contentView.addSubviewWithFit(
            HStack(alignment: .center) {
                VStack(alignment: .center) {
                    sut.distributed(.fillEqually)
                }
            }
        )
        sut.layoutIfNeeded()

        // then
        XCTAssertEqual(Set(sut.subviews.map { $0.bounds.width }).count, 1)
        XCTAssertEqual(Set(sut.subviews.map { $0.bounds.height }).count, 3)
    }

    func testOverlayAlignmentCenter() {
        // given
        let sut = Text()
            .frame(width: 100, height: 100)

        // when
        contentView.addSubviewWithFit(
            Text()
                .frame(width: 500, height: 500)
                .overlay(alignment: .center, view: sut)
        )
        contentView.layoutIfNeeded()

        // then
        XCTAssertEqual(contentView.center, contentView.convert(CGPoint(x: sut.bounds.midX, y: sut.bounds.midY), from: sut))
    }

    func testOverlayAlignmentTopLeading() {
        // given
        let sut = Text()
            .frame(width: 100, height: 100)

        // when
        contentView.addSubviewWithFit(
            Text()
                .frame(width: 500, height: 500)
                .overlay(alignment: .topLeading, view: sut)
        )
        contentView.layoutIfNeeded()

        // then
        XCTAssertEqual(CGRect(x: 0, y: 0, width: 100, height: 100), contentView.convert(sut.bounds, from: sut))
    }

    func testOverlayAlignmentBottomTrailing() {
        // given
        let sut = Text()
            .frame(width: 100, height: 100)

        // when
        contentView.addSubviewWithFit(
            Text()
                .frame(width: 500, height: 500)
                .overlay(alignment: .bottomTrailing, view: sut)
        )
        contentView.layoutIfNeeded()

        // then
        let output = contentView.convert(sut.bounds, from: sut)
        XCTAssertEqual(contentView.frame.maxX - 100, output.minX)
        XCTAssertEqual(contentView.frame.maxY - 100, output.minY)
        XCTAssertEqual(CGSize(width: 100, height: 100), output.size)
    }
    
    func testCenter() {
        // Given
        let sut = Text()
            .frame(width: 200, height: 200)
        
        // When
        contentView.addSubviewWithFit(
            ZStack {
                UIView()
                    .frame(width: 400, height: 400)
                sut.center()
            }.center()
        )
        contentView.layoutIfNeeded()
        
        // Then
        XCTAssertEqual(sut.center, CGPoint(x: 200, y: 200))
        XCTAssertEqual(sut.bounds.size, CGSize(width: 200, height: 200))
    }
}
