import SwiftUI

@main
struct SeedSwipeMobileApp: App {
    @AppStorage("signin") var isSignedIn = false

    var body: some Scene {
        WindowGroup {
            if !isSignedIn {
                LoginView()
                    .preferredColorScheme(.dark)
            } else {
                TabBarView()
                    .preferredColorScheme(.dark)
            }
        }
    }
}
