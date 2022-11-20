import Foundation
import Scenarios
import SwiftUI

@main
struct InternalApp: App {
    
    @StateObject
    private var model = ScenariosModel()
    
    var body: some Scene {
        WindowGroup {
            ScenariosView(model: model)
        }
    }
    
}
