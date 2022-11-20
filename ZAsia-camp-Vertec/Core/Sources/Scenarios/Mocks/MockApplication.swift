import OSFacade
import UIKit

final class MockApplication: Application {
    
    static let openSettingsURLString = "scheme://\(UUID().uuidString)"
    
    var urlToOpen: URL?
    
    func open(_ url: URL, options: [UIApplication.OpenExternalURLOptionsKey: Any] = [:], completionHandler completion: ((Bool) -> Void)? = nil) {
        urlToOpen = url
    }
}
