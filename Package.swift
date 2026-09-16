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
            .exact("15.15.0")
        ),
        .package(
            url: "https://github.com/AppLovin/AppLovin-MAX-Swift-Package.git",
            .exact("13.6.4")
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
            url: "https://github.com/tradplus/TradPlusAdSDK-SPM-AppLovin/releases/download/15.15.0/TPAppLovinAdapter-15.15.0.xcframework.zip",
            checksum: "4e7083ba4be390e7e97e78afe40313366d78dab49c8b40345e729e95beffc808"
        ),
    ]
)
