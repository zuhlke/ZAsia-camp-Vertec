import Domain
import Foundation
import Interface
import OSFacade
import SwiftUI

public struct RootView: View {

    @ObservedObject
    private var model: ApplicationModel
    
    @State
    private var counter = 0

    public init(model: ApplicationModel) {
        self.model = model
    }
    
    public var body: some View {
        switch dump(model.state) {
        case .loggedIn(let model):
            NavigationView {
                Button(action: { model.logOut() }) {
                    Text("Log out")
                }
            }
        case .loggedOut(let model):
            LoginView { formData in
                try? await model.logIn(username: formData.username, password: formData.password)
            }
            .task {
                while true {
                    print(Date())
                    try? await Task.sleep(for: .seconds(1))
                    self.counter += 1
                }
            }
        }
    }

}
