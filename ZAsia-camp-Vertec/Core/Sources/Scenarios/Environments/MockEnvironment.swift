import Foundation
import Integration
import SwiftUI
import Domain
import Support

public class MockEnvironmentScenario: Scenario {
    public static let name = "Mock"
    public static let kind = ScenarioKind.environment
    
    private static let model = ApplicationModel(environment: .mock)
    
    static var content: some View {
        RootView(model: model)
    }
    
}

private extension AppEnvironment {
    
    static var mock: AppEnvironment {
        AppEnvironment(loginClient: MockServer())
    }
    
}

private struct MockServer: HTTPClient {
    
    func perform(_ request: HTTPRequest) async -> Result<HTTPResponse, HTTPRequestPerformingError> {
        print(request)
        try? await Task.sleep(for: .milliseconds(300))
        return .success(response(to: request))
    }
    
    func response(to request: HTTPRequest) -> HTTPResponse {
        switch request.path {
        case "/login":
            
            return .init(statusCode: 200, body: .empty)
        default:
            print(request.path)
            return .init(statusCode: 404, body: .empty)
        }
    }
    
}
