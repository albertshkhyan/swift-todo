import SwiftUI

struct ProfileView: View {
    var body: some View {
        VStack {
            Text("👤 Profile")
                .font(.largeTitle)
                .padding()
            Text("User profile details go here.")
                .padding()
        }
        .navigationTitle("Profile")
    }
}
