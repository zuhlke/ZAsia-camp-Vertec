// swift-tools-version:5.7

import PackageDescription

let package = Package(
    name: "Core",
    defaultLocalization: "en",
    platforms: [
        .macOS(.v10_15),
        .iOS(.v16),
        .tvOS(.v14),
        .watchOS(.v6),
    ],
    products: [
        .library(
            name: "Integration",
            targets: ["Integration"]
        ),
        .library(
            name: "Scenarios",
            targets: ["Scenarios"]
        ),
    ],
    dependencies: [
        .package(
            url: "https://github.com/zuhlke/Support.git", branch: "main"
        ),
    ],
    targets: [
        .target(
            name: "Localization",
            dependencies: [
                "Support",
            ]
        ),
        .target(
            name: "Interface",
            dependencies: [
                "Support",
                "Localization",
            ]
        ),
        .target(
            name: "OSFacade",
            dependencies: [
                "Support",
            ]
        ),
        .target(
            name: "Domain",
            dependencies: [
                "Support",
                "OSFacade",
            ]
        ),
        .target(
            name: "Integration",
            dependencies: [
                "Support",
                "Localization",
                "Domain",
                "Interface",
            ]
        ),
        .target(
            name: "Scenarios",
            dependencies: [
                "Support",
                "Domain",
                "Interface",
                "Integration",
            ]
        ),
        .testTarget(
            name: "LocalizationTests",
            dependencies: [
                "Localization",
                .product(name: "TestingSupport", package: "Support"),
            ]
        ),
        .testTarget(
            name: "DomainTests",
            dependencies: [
                "Domain",
                .product(name: "TestingSupport", package: "Support"),
                "Scenarios",
            ]
        ),
        .testTarget(
            name: "IntegrationTests",
            dependencies: [
                "Integration",
                .product(name: "TestingSupport", package: "Support"),
                "Scenarios",
            ]
        ),
    ]
)
