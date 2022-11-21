import Domain
import Foundation
import Interface
import OSFacade
import SwiftUI

public struct RootView: View {

    @ObservedObject
    private var model: ApplicationModel

    public init(model: ApplicationModel) {
        self.model = model
    }
    
    public var body: some View {
        switch model.state {
        case .loggedIn:
            NavigationView {
                Button(action: { model.logOut() }) {
                    Text("Log out")
                }
            }
        case .loggedOut:
            LoginView { formData in
                try? await model.logIn(username: formData.username, password: formData.password)
            }
        }
    }

}
