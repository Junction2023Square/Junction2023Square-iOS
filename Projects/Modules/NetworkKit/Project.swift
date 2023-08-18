import ProjectDescription
import ProjectDescriptionHelpers
import UtilityPlugin

let frameworkName: String = "NetworkKit"

let frameworkTargets: [Target] = FrameworkFactory(
    dependency: .init(
        frameworkDependencies: [Dep.Project.ThirdPartyManager],
        unitTestsDependencies: []
    )
).build(
    payload: .init(
        name: frameworkName,
        platform: .iOS,
        product: .staticLibrary,
        infoPlist: ["TEST_FACT_API_KEY": "$(TEST_FACT_API_KEY)"]
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
