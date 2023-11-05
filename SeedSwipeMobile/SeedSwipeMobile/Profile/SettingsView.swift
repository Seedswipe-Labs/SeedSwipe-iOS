import SwiftUI

struct SettingsView: View {
    var body: some View {
        NavigationView {
            ZStack {
                Image("SeedSwipe_bg")
                    .resizable()
                    .scaledToFill()
                    .ignoresSafeArea()
                
                VStack {
                    Text("Stellar is awesome! :)")
                }
            }
        }
    }
}

#Preview {
    SettingsView()
        .preferredColorScheme(.dark)
}
