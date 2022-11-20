import Foundation
import OSFacade

public class ApplicationModel: ObservableObject {
    
    public let services: SystemServices

    public init(services: SystemServices = .shared) {
        self.services = services
    }
    
}
