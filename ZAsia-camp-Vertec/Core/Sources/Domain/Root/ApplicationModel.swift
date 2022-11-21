import Foundation
import OSFacade
import Support

public struct AppEnvironment {
    var loginClient: HTTPClient
    
    public init(loginClient: HTTPClient) {
        self.loginClient = loginClient
    }
}

@MainActor
public class ApplicationModel: ObservableObject {
    
    public enum State {
        case loggedOut
        case loggedIn
    }
    
    public let services: SystemServices
    public let environment: AppEnvironment
    
    private let httpService: HTTPService<LoginEndpoints>
    
    @Published
    private(set) public var state: State = .loggedOut

    public nonisolated init(environment: AppEnvironment, services: SystemServices = .shared) {
        self.services = services
        self.environment = environment
        httpService = HTTPService(client: environment.loginClient, endpoints: LoginEndpoints())
    }
    
    public func logIn(username: String, password: String) async throws {
        try await httpService.logIn(with: .init(username: username, password: password)).get()
        state = .loggedIn
    }
    
    public func logOut() {
        state = .loggedOut
    }
    
}
