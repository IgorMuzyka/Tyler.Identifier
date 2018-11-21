// swift-tools-version:4.2
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Tyler.Identifier",
    products: [
        .library(name: "Tyler.Identifier", targets: ["Identifier"]),
    ],
    dependencies: [],
    targets: [
        .target(name: "Identifier", dependencies: []),
    ]
)
