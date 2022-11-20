import Foundation
import Localization
@_exported import Scenarios
import XCTest

struct ApplicationRunner<Scenario: TestScenario>: TestProp {
    struct Configuration: TestPropConfiguration {
        var disableAnimations = true
    }
    
    private var configuration: Configuration
    
    static func prepare(_ test: XCTestCase) {
        test.continueAfterFailure = false
    }
    
    init(configuration: Configuration) {
        self.configuration = configuration
    }
    
    var scenario: Scenario.Type {
        Scenario.self
    }
    
    func run(file: StaticString = #file, line: UInt = #line, work: (XCUIApplication) throws -> Void) throws {
        
        let app = XCUIApplication()
        app.launchEnvironment[ScenariosModel.disableAnimations] = configuration.disableAnimations ? "1" : "0"
        app.launchEnvironment[ScenariosModel.disableHardwareKeyboard] = "1"
        app.launchArguments = [
            "-\(ScenariosModel.activeScenarioDefaultKey)", Scenario.id,
        ]
        
        app.launch()
        
        try work(app)
    }
    
}
