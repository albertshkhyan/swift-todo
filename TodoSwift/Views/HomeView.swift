import SwiftUI

struct HomeView: View { // ✅ Renamed from ContentView to HomeView
    @StateObject var viewModel = TodoViewModel()

    var body: some View {
        NavigationView {
            VStack {
                Text("📝 Todo App - Home Screenn")
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
            // navigationTitle("🏡 Home Screen") - Sets the title at the top of the Home screen.
            .navigationTitle("Home")
        }
    }
}

#Preview {
    HomeView() // ✅ Previewing the HomeView
}
