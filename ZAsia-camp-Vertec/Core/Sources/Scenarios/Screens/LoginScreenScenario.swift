import Foundation
import Interface
import SwiftUI

public class LoginScreenScenario: Scenario {
    public static let name = "Login"
    public static let kind = ScenarioKind.screen
    
    static var content: some View {
        LoginView()
    }
    
}
