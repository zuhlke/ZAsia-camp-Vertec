import Foundation
import SwiftUI

struct ScenarioSelectorView: View {
    private struct ScenarioKindSection: Identifiable {
        var kind: ScenarioKind

        var id: ScenarioKind {
            kind
        }

        var scenarios: [ScenarioId]
    }

    private var sections: [ScenarioKindSection]
    private var select: (ScenarioId) -> Void

    init(scenarioIds: [ScenarioId], select: @escaping (ScenarioId) -> Void) {
        self.select = select

        let scenariosPerKind = Dictionary(grouping: scenarioIds) { $0.scenarioType.kind }
            .mapValues { $0.sorted(by: { $0.scenarioType.name < $1.scenarioType.name }) }

        sections = ScenarioKind.allCases.compactMap { kind in
            guard let scenarios = scenariosPerKind[kind], !scenarios.isEmpty else { return nil }
            return ScenarioKindSection(kind: kind, scenarios: scenarios)
        }
    }

    var body: some View {
        NavigationView {
            List {
                ForEach(sections) { section in
                    Section(header: Text(verbatim: section.kind.name)) {
                        ForEach(section.scenarios) { scenario in
                            HStack {
                                Button(action: { select(scenario) }) {
                                    Text(verbatim: scenario.scenarioType.name)
                                }
                            }
                        }
                    }
                }
            }
            .listStyle(GroupedListStyle())
            .navigationTitle(Text(verbatim: "Scenarios"))
        }
        .navigationViewStyle(StackNavigationViewStyle())
    }
}
