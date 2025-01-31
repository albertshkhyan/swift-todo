//
//  TodoSwiftApp.swift
//  TodoSwift
//
//  Created by Albert Shkhyan on 31.01.25.
//

import SwiftUI

@main // This marks `TodoSwiftApp` as the entry point of the application
struct TodoSwiftApp: App {// struct is lightweight, value-type alternative to classes.
    init() {// This is like constructor
        print("✅ Hello, World! SwiftUI app is launching...") // N:1
    }

    // Defines the UI structure
    var body: some Scene {// this like render()
        // Creates the main app window (React: Similar to `ReactDOM.render(<App />, rootElement)`)
        WindowGroup {// This like react-router - React Router for Multi-Screen Apps
            ContentView()// ContentView automatically because it conforms to View (struct ContentView: View {... )
                .onAppear {// Runs when ContentView appears (React: Similar to `useEffect(() => {}, [])`) (this like componentDidMount)
                    print("📌 ContentView has appeared!")// N: 4
                }
        }
    }
}
