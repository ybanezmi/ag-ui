// swift-tools-version: 5.9
// Root manifest so SwiftPM can depend on the Swift SDK by this repository's URL.
// The SDK itself lives in sdks/community/swift; run its tests from there.

import PackageDescription

let sdk = "sdks/community/swift/Sources"

let package = Package(
    name: "AGUISwift",
    platforms: [
        .iOS(.v16),
        .macOS(.v13),
    ],
    products: [
        .library(name: "AGUICore", targets: ["AGUICore"]),
        .library(name: "AGUIClient", targets: ["AGUIClient"]),
        .library(name: "AGUIAgentSDK", targets: ["AGUIAgentSDK"]),
        .library(name: "AGUITools", targets: ["AGUITools"]),
    ],
    targets: [
        .target(name: "AGUICore", path: "\(sdk)/AGUICore"),
        .target(name: "AGUIClient", dependencies: ["AGUICore"], path: "\(sdk)/AGUIClient"),
        .target(name: "AGUIAgentSDK", dependencies: ["AGUICore", "AGUIClient", "AGUITools"], path: "\(sdk)/AGUIAgentSDK"),
        .target(name: "AGUITools", dependencies: ["AGUICore"], path: "\(sdk)/AGUITools"),
    ]
)
