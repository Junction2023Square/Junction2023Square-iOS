import ProjectDescription
import ProjectDescriptionHelpers
import UtilityPlugin

let frameworkName: String = "DataKit"

let frameworkTargets: [Target] = FrameworkFactory(
    dependency: .init(
        frameworkDependencies: [
            Dep.Project.DomainKit,
            Dep.Project.CoreKit,
            Dep.Project.NetworkKit
        ],
        unitTestsDependencies: []
    )
).build(
    payload: .init(
        name: frameworkName,
        platform: .iOS,
        product: .staticLibrary
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
