import Domain
import Foundation
import Interface
import OSFacade
import SwiftUI

public struct RootView: View {

    private var model: ApplicationModel

    public init(model: ApplicationModel) {
        self.model = model
    }
    
    public var body: some View {
        WelcomeView(date: model.services.dateProvider.now)
    }

}
