import Foundation
import Interface
import SwiftUI

public class LoginScreenScenario: Scenario {
    public static let name = "Login"
    public static let kind = ScenarioKind.screen
    
    static var content: some View {
        HostView()
    }
    
}

private struct HostView: View {
    
    var body: some View {
        LoginView { formData in
            try? await Task.sleep(for: .seconds(3))
        }
    }
    
}
