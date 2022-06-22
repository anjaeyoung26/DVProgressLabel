// swift-tools-version:5.0

import PackageDescription

let package = Package(
    name: "DVProgressLabel",
    platforms: [
        .iOS(.v10)
    ],
    products: [
        .library(name: "DVProgressLabel",
                 targets: ["DVProgressLabel"])
    ],
    targets: [
        .target(name: "DVProgressLabel",
                path: "DVProgressLabel/Classes")
    ],
    swiftLanguageVersions: [
        .v5
    ]
)
