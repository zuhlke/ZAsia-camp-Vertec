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
            XCTAssert(loginScreen.textFieldUserName.exists)
            XCTAssert(loginScreen.textFieldPassword.exists)
            XCTAssert(loginScreen.buttonLogin.exists)
        }
    }

    func testLoggingInShowsLoadingIndicator() throws {
        try runner.run { app in
            let loginScreen = LoginScreen(app: app)
            loginScreen.textFieldUserName.tap()
            loginScreen.textFieldUserName.typeText("me")
            loginScreen.textFieldPassword.tap()
            loginScreen.textFieldPassword.typeText("pass")
            loginScreen.buttonLogin.tap()
            XCTAssert(loginScreen.loadingIndicator.exists)
        }
    }
}
