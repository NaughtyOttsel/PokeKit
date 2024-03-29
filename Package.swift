// swift-tools-version:5.0

import PackageDescription

let package = Package(
    name: "PokeKit",
    platforms: [
        .macOS(SupportedPlatform.MacOSVersion.v10_14),
        .iOS(SupportedPlatform.IOSVersion.v9),
        .watchOS(SupportedPlatform.WatchOSVersion.v2),
        .tvOS(SupportedPlatform.TVOSVersion.v9),
    ],
    products: [
        // Products define the executables and libraries produced by a package, and make them visible to other packages.
        .library(
            name: "PokeKit",
            targets: ["PokeKit"]
        ),
    ],
    dependencies: [
        // Dependencies declare other packages that this package depends on.
        // .package(url: /* package url */, from: "1.0.0"),
    ],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages which this package depends on.
        .target(
            name: "PokeKit",
            dependencies: []
        ),
        .testTarget(
            name: "PokeKitTests",
            dependencies: ["PokeKit"]
        ),
    ]
)
