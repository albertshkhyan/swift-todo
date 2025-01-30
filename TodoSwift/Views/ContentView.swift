import SwiftUI

struct ContentView: View {
    @StateObject var viewModel = TodoViewModel()

    var body: some View {
        NavigationView {
            VStack {
                Text("📝 Todo App - Home Screen")
                    .font(.largeTitle)
                    .padding()

                NavigationLink(destination: TestView()) {
                    Text("➡️ Go to Test View")
                        .foregroundColor(.white)
                        .padding()
                        .background(Color.blue)
                        .cornerRadius(8)
                }
                .padding()

                TaskListView(viewModel: viewModel)
            }
            .navigationTitle("Home")

            // ✅ Add a default detail view to prevent empty space
            Text("Select an option from the menu")
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .background(Color.gray.opacity(0.1))
        }
    }
}
