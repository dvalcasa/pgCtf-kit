// swift-tools-version: 6.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "pgCtf-kit",
    platforms: [
        .macOS(.v15),
        .iOS(.v16),
        .watchOS(.v11),
        .tvOS(.v18),
    ],
    products: [
        // Products define the executables and libraries a package produces, making them visible to other packages.
        .library(
            name: "pgCtfKit",
            targets: ["pgCtfKit"]
        ),
    ],
    targets: [
        // Targets are the basic building blocks of a package, defining a module or a test suite.
        // Targets can depend on other targets in this package and products from dependencies.
        .target(
            name: "pgCtfKit"
        ),
        .testTarget(
            name: "pgCtfKitTests",
            dependencies: ["pgCtfKit"]
        ),
    ],
    swiftLanguageModes: [.v6]
)
