import Interface
import Scenarios
import XCTest

class WelcomeScreenTests: XCTestCase {
    @Propped
    private var runner: ApplicationRunner<WelcomeScreenScenario>

    func testBasics() throws {
        try runner.run { app in
            let screen = WelcomeScreen(app: app)

            XCTAssert(screen.heading.exists)
            XCTAssert(screen.caption(for: runner.scenario.date).exists)
        }
    }
}
