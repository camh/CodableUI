// swift-tools-version: 6.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
	name: "CodableUI",
	platforms: [.iOS(.v17), .macCatalyst(.v15), .macOS(.v15)],
	products: [
		.library(
			name: "CodableUI",
			targets: ["CodableUI"]),
	],
	targets: [
		.target(
			name: "CodableUI"),
	]
)
