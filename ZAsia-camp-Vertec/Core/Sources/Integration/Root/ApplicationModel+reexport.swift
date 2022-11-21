import Domain
import Support

// The host application needs to be able to initialise `ApplicationModel`, but will almost certainly not need access to
// any other API from `Domain`.
//
// Make `ApplicationModel` available as a typealias to avoid having to import `Domain` in the app target directly.

public typealias ApplicationModel = Domain.ApplicationModel

extension AppEnvironment {
    
    public static var production: AppEnvironment {
        AppEnvironment(
            loginClient: URLSessionHTTPClient(remote: HTTPRemote(host: "vertec.com", path: "/v1"))
        )
    }
    
}

