import ProjectDescription
import ProjectDescriptionHelpers
import UtilityPlugin

let frameworkName: String = "ThirdPartyManager"

let frameworkTargets: [Target] = FrameworkFactory(
    dependency: .init(
        frameworkDependencies: [
            .SPM.Kingfisher,
            .SPM.TCA,
            .SPM.Alamofire,
            .SPM.Swinject,
            .SPM.SwiftUIFlowLayout
        ],
        unitTestsDependencies: []
    )
).build(
    payload: .init(
        name: frameworkName,
        platform: .iOS,
        product: .framework
    )
)

let project = ProjectFactory(
    dependency: .init(
        appTargets: [],
        frameworkTargets: frameworkTargets
    )
).build(
    payload: .init(
        name: frameworkName,
        organizationName: "kr.junction.square"
    )
)
