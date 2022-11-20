import Foundation
import Integration
import SwiftUI

public class ProductionEnvironmentScenario: Scenario {
    public static let name = "Production"
    public static let kind = ScenarioKind.environment
    
    private static let model = ApplicationModel()
    
    static var content: some View {
        RootView(model: model)
    }
    
}
