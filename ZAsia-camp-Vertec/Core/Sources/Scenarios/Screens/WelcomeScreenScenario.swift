import Foundation
import Interface
import SwiftUI

public class WelcomeScreenScenario: Scenario {
    public static let name = "Welcome"
    public static let kind = ScenarioKind.screen
    
    public static let date = Date(timeIntervalSinceReferenceDate: 86401)
    
    static var content: some View {
        WelcomeView(date: date)
    }
    
}
