import SwiftUI

struct TestView: View {
    @Environment(\.presentationMode) var presentationMode  // ✅ Allows dismissing in iOS

    var body: some View {
        VStack {
            Text("🛠 Test View")
                .font(.largeTitle)
                .padding()
            Text("This is a placeholder for testing new features.")
                .padding()

            Button(action: {
                #if os(macOS)
                NSApplication.shared.terminate(nil)  // ✅ Closes app in macOS
                #else
                presentationMode.wrappedValue.dismiss()  // ✅ Goes back in iOS
                #endif
            }) {
                Text("⬅️ Back / Close")
                    .foregroundColor(.white)
                    .padding()
                    .background(Color.red)
                    .cornerRadius(8)
            }
            .padding()
        }
        .navigationTitle("Test View")
        .onAppear {
            print("🔍 TestView has appeared!")
        }
    }
}
