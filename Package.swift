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
            .exact("15.13.0")
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
            url: "https://github.com/tradplus/TradPlusAdSDK-SPM-AppLovin/releases/download/15.13.0/TPAppLovinAdapter-15.13.0.xcframework.zip",
            checksum: "d8294a4cd469930654cd4703ce89a1e121bb0ddb94efe329f06b3b83092e7900"
        ),
    ]
)
