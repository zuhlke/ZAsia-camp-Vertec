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
    
    private enum RawState {
        case loggedOut
        case loggedIn
    }
    
    public enum State {
        case loggedOut(PreLoginModel)
        case loggedIn(PostLoginModel)
    }
    
    public let services: SystemServices
    public let environment: AppEnvironment
    
    private let httpService: HTTPService<LoginEndpoints>
    
    @Published
    private var rawState: RawState = .loggedOut
    
    public var state: State {
        switch rawState {
        case .loggedOut:
            return .loggedOut(PreLoginModel(httpService: httpService, didLogIn: { _ in
                self.rawState = .loggedIn
            }))
        case .loggedIn:
            return .loggedIn(PostLoginModel(didLogOut: {
                self.rawState = .loggedOut
            }))
        }
    }
    
    public nonisolated init(environment: AppEnvironment, services: SystemServices = .shared) {
        self.services = services
        self.environment = environment
        httpService = HTTPService(client: environment.loginClient, endpoints: LoginEndpoints())
    }
}

@MainActor
public class PreLoginModel {
    
    private let httpService: HTTPService<LoginEndpoints>
    private let didLogIn: (String) -> Void
    
    init(httpService: HTTPService<LoginEndpoints>, didLogIn: @escaping (String) -> Void) {
        self.httpService = httpService
        self.didLogIn = didLogIn
    }
    
    public func logIn(username: String, password: String) async throws {
        try await httpService.logIn(with: .init(username: username, password: password)).get()
        didLogIn("token")
    }
}


@MainActor
public class PostLoginModel {
    
    private let didLogOut: () -> Void
    
    init(didLogOut: @escaping () -> Void) {
        self.didLogOut = didLogOut
    }
    
    public func logOut() {
        didLogOut()
    }
    
}
