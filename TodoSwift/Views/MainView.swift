import SwiftUI

struct MainView: View {
    init() {
         UITabBar.appearance().unselectedItemTintColor = UIColor.green // Change inactive tab color
         // UITabBar.appearance().tintColor = UIColor.red // 🔴 Active tab color globally
     }

    var body: some View {
        TabView { // 📌 SwiftUI's TabView is like React Navigation's BottomTabNavigator

            // 🏠 Home Screen
            HomeView()
                .tabItem { // 📌 This defines the tab's icon and label
                    // SwiftUI allows you to use SF Symbols (Apple’s built-in icons) via Image(systemName:):
                    Image(systemName: "house.fill") // React: <Ionicons name="home" size={24} />, Active = Blue, Inactive = Gray
                    Text("Home") // React: <Text>Home</Text>
                }
            
            // 🛠 Test Screen
            TestView()
                .tabItem {
                    Image(systemName: "hammer.fill") // React: <Ionicons name="construct" size={24} />
                    Text("Test")
                }
            
            // 👤 Profile Screen
            ProfileView()
                .tabItem {
                    Image(systemName: "person.fill") // React: <Ionicons name="person" size={24} />
                    Text("Profile")
                }
            
            // ⚙️ Settings Screen
            SettingsView()
                .tabItem {
                    Image(systemName: "gearshape.fill") // React: <Ionicons name="settings" size={24} />
                    Text("Settings")
                }
        }
         .accentColor(.red)// Changes the selected tab color to red
    }
}

/*
 By default, SwiftUI assigns the following colors to tab bar icons in TabView:

 Active (Selected) Tab → Blue
 Inactive (Unselected) Tabs → Gray
*/
