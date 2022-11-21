import Interface
import Scenarios
import XCTest

class LoginScreenTests: XCTestCase {
    
    @Propped
    private var runner: ApplicationRunner<LoginScreenScenario>

    func testBasics() throws {
        try runner.run { app in
            let loginScreen = LoginScreen(app: app)
            XCTAssert(loginScreen.heading.exists)
        }
    }
}
