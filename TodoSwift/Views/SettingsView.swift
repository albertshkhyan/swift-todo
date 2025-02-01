import SwiftUI

struct SettingsView: View {
    var body: some View {
        VStack {
            Text("⚙️ Settings")
                .font(.largeTitle)
                .padding()
            Text("Modify your preferences here.")
                .padding()
        }
        .navigationTitle("Settings")
    }
}
