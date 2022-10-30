// swift-tools-version:5.1
// The swift-tools-version declares the minimum version of Swift required to build this package.
import PackageDescription

let package = Package(
    name: "HypeUI",
    platforms: [
        .iOS(.v12)
    ],
    products: [
        .library(name: "HypeUI", targets: ["HypeUI"]),
    ],
    dependencies: [
        .package(url: "https://github.com/ReactiveX/RxSwift.git", .upToNextMajor(from: "6.2.0")),
        .package(url: "https://github.com/SnapKit/SnapKit.git", .upToNextMajor(from: "5.6.0")),
    ],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages which this package depends on.
        .target(
            name: "HypeUI",
            dependencies: ["RxSwift", "SnapKit"]),
        .testTarget(
            name: "HypeUITests",
            dependencies: ["HypeUI"]),
    ]
)


