import ProjectDescription

let carthage = CarthageDependencies([])

let spm = SwiftPackageManagerDependencies([
    .remote(url: "https://github.com/pointfreeco/swift-composable-architecture", requirement: .upToNextMajor(from: "1.1.0")),
    .remote(url: "https://github.com/onevcat/Kingfisher", requirement: .upToNextMajor(from: "7.8.1")),
    .remote(url: "https://github.com/Swinject/Swinject", requirement: .upToNextMajor(from: "2.8.3")),
    .remote(url: "https://github.com/Alamofire/Alamofire", requirement: .upToNextMajor(from: "5.7.0")),
    .remote(url: "https://github.com/Quick/Quick", requirement: .upToNextMajor(from: "7.0.0")),
    .remote(url: "https://github.com/Quick/Nimble", requirement: .upToNextMajor(from: "12.0.0")),
    .remote(url: "https://github.com/globulus/swiftui-flow-layout", requirement: .upToNextMajor(from: "1.0.5"))
])

let dependencies = Dependencies(
    carthage: carthage,
    swiftPackageManager: spm,
    platforms: [.iOS]
)
