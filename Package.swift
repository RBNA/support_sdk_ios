// swift-tools-version:5.5
import PackageDescription
let package = Package(
    name: "ZendeskSupportSDK",
    platforms: [
        .iOS(.v10)
    ],
    products: [
        .library(
            name: "ZendeskSupportSDK",
            targets: [
              "ZendeskSupportSDKTargets"
            ]
        )
    ],
    dependencies: [
        .package(name: "ZendeskSupportProvidersSDK",
                 url: "https://github.com/RBNA/support_providers_sdk_ios",
                 branch: "master"),
        .package(name: "ZendeskMessagingSDK",
                 url: "https://github.com/RBNA/messaging_sdk_ios",
                 branch: "master")
    ],
    targets: [
        .binaryTarget(
            name: "ZendeskSupportSDK",
            path: "ZendeskSupportSDK.xcframework"
        ),
        .target(name: "ZendeskSupportSDKTargets",
                dependencies: [
                    .target(name: "ZendeskSupportSDK"),
                    .product(name: "ZendeskSupportProvidersSDK", package: "ZendeskSupportProvidersSDK"),
                    .product(name: "ZendeskMessagingSDK", package: "ZendeskMessagingSDK")
                ],
                path: "Sources"
        )
    ]
)
