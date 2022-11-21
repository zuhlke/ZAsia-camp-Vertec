import Foundation
import XCTest
import Domain
import Support

class LoginTests: XCTestCase {
    
    func testLoggingIn() async throws {
        let model = ApplicationModel(environment: .mock)
        try await model.logIn(username: "user", password: "pass")
        XCTAssertEqual(model.state, .loggedIn)
    }
    
}

private extension AppEnvironment {
    
    static var mock: AppEnvironment {
        AppEnvironment(loginClient: MockServer())
    }
    
}

private struct MockServer: HTTPClient {
    
    func perform(_ request: HTTPRequest) async -> Result<HTTPResponse, HTTPRequestPerformingError> {
        try? await Task.sleep(for: .milliseconds(300))
        return .success(response(to: request))
    }
    
    func response(to request: HTTPRequest) -> HTTPResponse {
        switch request.path {
        case "/login":
            return .init(statusCode: 200, body: .empty)
        default:
            return .init(statusCode: 404, body: .empty)
        }
    }
    
}
