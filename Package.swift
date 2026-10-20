// swift-tools-version: 5.10
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "pgCtf-kit",
    platforms: [
        .macOS(.v14),
        .iOS(.v16)
    ],
    products: [
        // Products define the executables and libraries a package produces, making them visible to other packages.
        .library(
            name: "pgCtfKit",
            targets: ["pgCtfKit"]
        ),
        .library(name: "pgCtfKitFluent",
                 targets: ["pgCtfKitFluent"])
    ],
    dependencies: [
        // 💧 A server-side Swift web framework.
        .package(url: "https://github.com/vapor/vapor.git", from: "4.121.3"),
        // 🗄 An ORM for SQL and NoSQL databases.
        .package(url: "https://github.com/vapor/fluent.git", from: "4.13.0"),
    ],
    targets: [
        // Targets are the basic building blocks of a package, defining a module or a test suite.
        // Targets can depend on other targets in this package and products from dependencies.
        .target(
            name: "pgCtfKit",
            swiftSettings: swiftSettings
        ),
        .target(
            name: "pgCtfKitFluent",
            dependencies: [
                "pgCtfKit",
                .product(name: "Vapor", package: "vapor"),
                .product(name: "Fluent", package: "fluent"),
            ],
            swiftSettings: swiftSettings
        ),
        .testTarget(
            name: "pgCtfKitTests",
            dependencies: ["pgCtfKit"]
        ),
    ]
)

var swiftSettings: [SwiftSetting] { [
    .enableUpcomingFeature("DisableOutwardActorInference"),
    .enableExperimentalFeature("StrictConcurrency"),
] }
