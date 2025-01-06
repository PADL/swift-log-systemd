// swift-tools-version: 6.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
  name: "SystemdJournal",
  platforms: [
    .macOS(.v10_15),
  ],
  products: [
    // Products define the executables and libraries a package produces, making them visible to
    // other packages.
    .library(
      name: "SystemdJournal",
      targets: ["SystemdJournal"]
    ),
  ],
  dependencies: [
    .package(
      url: "https://github.com/apple/swift-log",
      from: "1.6.2"
    ),
  ],
  targets: [
    .target(
      name: "CSystemdJournal",
      linkerSettings: [.linkedLibrary("systemd")]
    ),
    .target(
      name: "SystemdJournal",
      dependencies: [
        "CSystemdJournal",
        .product(name: "Logging", package: "swift-log"),
      ],
      swiftSettings: [.swiftLanguageMode(.v5)]
    ),
  ]
)
