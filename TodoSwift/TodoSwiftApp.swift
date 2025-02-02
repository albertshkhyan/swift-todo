import SwiftUI

@main // This marks `TodoSwiftApp` as the entry point of the application
struct TodoSwiftApp: App {// struct is lightweight, value-type alternative to classes.
    init() {// This is like constructor
        print("✅ Hello, World! SwiftUI app is launching...")
        Thread.sleep(forTimeInterval: 2.0)// This will keep the Launch Screen visible for 2 seconds before loading the app.
    }

    var body: some Scene {
        WindowGroup {
            MainView()
        }
    }
}

#Preview {
    MainView() // This will render the app's starting screen
}
