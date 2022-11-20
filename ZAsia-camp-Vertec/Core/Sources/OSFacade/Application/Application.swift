import UIKit

public protocol Application {
    static var openSettingsURLString: String { get }
    func open(_ url: URL, options: [UIApplication.OpenExternalURLOptionsKey: Any], completionHandler completion: ((Bool) -> Void)?)
}

extension UIApplication: Application {}

public extension Application {
    
    func open(_ url: URL, options: [UIApplication.OpenExternalURLOptionsKey: Any] = [:], completionHandler completion: ((Bool) -> Void)? = nil) {
        open(url, options: options, completionHandler: completion)
    }
    
    func openSettings() {
        if let url = URL(string: Self.openSettingsURLString) {
            open(url)
        }
    }
    
}

public extension Notification.Name {
    
    static let applicationWillEnterForeground = UIApplication.willEnterForegroundNotification
    
}
