import Foundation
import SwiftUI

public struct ScenariosView: View {
    
    @ObservedObject
    private var model: ScenariosModel
    
    public init(model: ScenariosModel) {
        self.model = model
    }
    
    public var body: some View {
        if let selectedScenario = model.selectedScenarioId?.scenarioType {
            selectedScenario.typeErasedView
        } else {
            ScenarioSelectorView(scenarioIds: model.scenarioIds, select: model.select)
        }
    }
    
}
