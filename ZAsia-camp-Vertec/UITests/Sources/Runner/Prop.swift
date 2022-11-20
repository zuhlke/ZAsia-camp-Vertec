import Foundation
import XCTest

protocol TestPropConfiguration {
    init()
}

protocol TestProp {
    associatedtype Configuration = Void
    
    static func prepare(_ test: XCTestCase)
    static var defaultConfiguration: Configuration { get }
    init(configuration: Configuration) throws
}

extension TestProp {
    
    static func prepare(_ test: XCTestCase) {}
    
}

extension TestProp where Configuration: TestPropConfiguration {
    
    static var defaultConfiguration: Configuration { Configuration() }
    
}

extension TestProp where Configuration == Void {
    
    static var defaultConfiguration: Void { () }
    
}

@propertyWrapper
class Propped<Prop: TestProp> {
    
    private enum State {
        case notInitialized
        case initialized(Prop)
    }
    
    private var state = State.notInitialized
    private weak var instance: XCTestCase?
    
    private var configuration = Prop.defaultConfiguration
    
    var wrappedValue: Prop {
        guard let instance = instance else {
            preconditionFailure("Wrapped property called when we do not have an instance")
        }
        switch state {
        case .notInitialized:
            do {
                Prop.prepare(instance)
                let value = try Prop(configuration: configuration)
                state = .initialized(value)
                instance.addTeardownBlock {
                    self.state = .notInitialized
                }
                return value
            } catch {
                preconditionFailure("Failed to create prop: \(error)")
            }
        case .initialized(let value):
            return value
        }
    }
    
    var projectedValue: Prop.Configuration {
        get {
            configuration
        }
        set {
            switch state {
            case .notInitialized:
                configuration = newValue
            case .initialized:
                preconditionFailure("Mutating configuration after prop is initialized is not suppored")
            }
        }
    }
    
    public static subscript<Instance: XCTestCase, Prop: TestProp>(
        _enclosingInstance instance: Instance,
        wrapped wrappedKeyPath: KeyPath<Instance, Prop>,
        storage storageKeyPath: KeyPath<Instance, Propped<Prop>>
    ) -> Prop? {
        instance[keyPath: storageKeyPath].instance = instance
        return instance[keyPath: storageKeyPath].wrappedValue
    }
    
}
