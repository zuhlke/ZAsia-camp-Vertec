import Foundation
import Integration
import SwiftUI

@main
struct ProductionApp: App {
    
    @StateObject
    private var model = ApplicationModel(environment: .production)
    
    var body: some Scene {
        WindowGroup {
            RootView(model: model)
        }
    }
    
}
