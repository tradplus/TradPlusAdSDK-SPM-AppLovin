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
            .exact("15.16.0")
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
            url: "https://github.com/tradplus/TradPlusAdSDK-SPM-AppLovin/releases/download/15.16.0/TPAppLovinAdapter-15.16.0.xcframework.zip",
            checksum: "fa16e75157decd807649c34cb799842938050655d25b7128920679a486f5fc1e"
        ),
    ]
)
