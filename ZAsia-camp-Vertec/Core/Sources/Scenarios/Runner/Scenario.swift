import Integration
import ObjectiveC
import SwiftUI
import UIKit

public enum ScenarioKind: CaseIterable, Identifiable {
    case environment
    case flow
    case screen
    case screenTemplate
    case component
    case prototype
    
    public var id: ScenarioKind { self }
    
    var name: String {
        switch self {
        case .environment: return "Environments"
        case .flow: return "Flows"
        case .screen: return "Screens"
        case .screenTemplate: return "Screen Templates"
        case .component: return "Components"
        case .prototype: return "Prototypes"
        }
    }
}

public protocol IdentifiableType: AnyObject {
    static var id: String { get }
}

public extension IdentifiableType {
    static var id: String {
        NSStringFromClass(Self.self)
    }
}

public protocol TestScenario: IdentifiableType {
    static var name: String { get }
    static var kind: ScenarioKind { get }
}

protocol TypeErasedScenario: TestScenario {
    static var id: String { get }
    static var typeErasedView: AnyView { get }
}

protocol Scenario: TypeErasedScenario {
    associatedtype Content: View
    static var content: Content { get }
}

extension Scenario {
    static var typeErasedView: AnyView {
        AnyView(content)
    }
}
