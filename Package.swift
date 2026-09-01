// swift-tools-version:5.3

import PackageDescription

let package = Package(
    name: "TradPlusAppLovinAdapter",
    platforms: [
        .iOS(.v12),
    ],
    products: [
        .library(
            name: "TradPlusAppLovinAdapter",
            targets: ["TradPlusAppLovinAdapter"]
        ),
    ],
    dependencies: [
        .package(
            url: "https://github.com/tradplus/TradPlusAdSDK-SPM.git",
            .exact("15.14.0")
        ),
        .package(
            url: "https://github.com/AppLovin/AppLovin-MAX-Swift-Package.git",
            .exact("13.6.3")
        ),
    ],
    targets: [
        .target(
            name: "TradPlusAppLovinAdapter",
            dependencies: [
                .target(name: "TPAppLovinAdapter"),
                .product(name: "TradPlusAdSDK", package: "TradPlusAdSDK-SPM"),
                .product(name: "AppLovinSDK", package: "AppLovin-MAX-Swift-Package"),
            ],
            path: ".",
            sources: ["Sources/TradPlusAppLovinAdapter/TradPlusAppLovinAdapter.swift"]
        ),
        .binaryTarget(
            name: "TPAppLovinAdapter",
            url: "https://github.com/tradplus/TradPlusAdSDK-SPM-AppLovin/releases/download/15.14.0/TPAppLovinAdapter-15.14.0.xcframework.zip",
            checksum: "11d167da7a0d16d887b1c2501f573d55b1ca046f129a4f9093e7a4244a844bef"
        ),
    ]
)
