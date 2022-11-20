import Foundation
import Localization
import SwiftUI

public struct WelcomeView: View {
    
    public var date: Date
    
    public init(date: Date) {
        self.date = date
    }
    
    @ViewBuilder
    public var body: some View {
        Text(.hello_dev)
            .font(.headline)
        Text(.today(date: date))
            .font(.body)
    }
}
