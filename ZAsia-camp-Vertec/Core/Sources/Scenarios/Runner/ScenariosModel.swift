import Foundation
import Integration
import Support
import SwiftUI

public class ScenariosModel: ObservableObject {
    
    public static let activeScenarioDefaultKey = "activeScenario"
    public static let disableAnimations = "disable_animations"
    public static let disableHardwareKeyboard = "disable_hardware_keyboard"
    
    let scenarioIds = ScenarioId.allCases
    
    @Published
    private(set) var selectedScenarioId: ScenarioId?
    
    public init() {
        prepareForTesting()
        
        if let selectedScenarioRawId = UserDefaults.standard.string(forKey: Self.activeScenarioDefaultKey) {
            selectedScenarioId = ScenarioId(rawValue: selectedScenarioRawId)
        }
    }
    
    func select(_ scenarioId: ScenarioId) {
        selectedScenarioId = scenarioId
    }
    
    private func prepareForTesting() {
        if
            let disableAnimations = Int(ProcessInfo.processInfo.environment[Self.disableAnimations] ?? ""),
            disableAnimations > 0
        {
            UIView.setAnimationsEnabled(false)
        }
        
        if
            let disableHardwareKeyboard = Int(ProcessInfo.processInfo.environment[Self.disableHardwareKeyboard] ?? ""),
            disableHardwareKeyboard > 0
        {
            // From https://stackoverflow.com/a/57618331
            let setHardwareLayout = NSSelectorFromString("setHardwareLayout:")
            UITextInputMode.activeInputModes
                .filter { $0.responds(to: setHardwareLayout) }
                .forEach { $0.perform(setHardwareLayout, with: nil) }
        }
    }
    
}
