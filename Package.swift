// swift-tools-version: 5.8
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "CoreOpenAI",
    defaultLocalization: "en",
    platforms: [.iOS(.v16), .tvOS(.v16), .macOS(.v13), .watchOS(.v9), .macCatalyst(.v16)],
    products: [
        // Products define the executables and libraries a package produces, and make them visible to other packages.
        .library(name: "CoreOpenAI", targets: ["CoreOpenAI"]),
    ],
    dependencies: [
        .package(url: "https://github.com/apple/swift-openapi-generator.git", .upToNextMajor(from: "0.1.1")),
        .package(url: "https://github.com/apple/swift-openapi-urlsession.git", .upToNextMajor(from: "0.1.1")),
        .package(url: "https://github.com/apple/swift-openapi-runtime.git", .upToNextMinor(from: "0.1.3")),
    ],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages this package depends on.
        .target(name: "CoreOpenAI", dependencies: [.product(name: "OpenAPIRuntime", package: "swift-openapi-runtime"),
                                                   .product(name: "OpenAPIURLSession", package: "swift-openapi-urlsession")],
                                    plugins: [.plugin(name: "OpenAPIGenerator", package: "swift-openapi-generator")]),
        .testTarget(name: "CoreOpenAITests", dependencies: ["CoreOpenAI",
                                                            .product(name: "OpenAPIRuntime", package: "swift-openapi-runtime"),
                                                            .product(name: "OpenAPIURLSession", package: "swift-openapi-urlsession")],
                     resources: [.copy("TestData")]),
    ]
)
