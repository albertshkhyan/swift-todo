import SwiftUI

struct MainView: View {
    // 📌 React Equivalent: const [notificationCount, setNotificationCount] = useState(3);
    @State private var notificationCount = 3 // 🛑 Holds the notification badge count

    init() {
        // 🎨 Customize Tab Bar Appearance (Optional)
        // UITabBar.appearance().unselectedItemTintColor = UIColor.green // Change inactive tab color
        // UITabBar.appearance().tintColor = UIColor.red // 🔴 Active tab color globally
    }

    var body: some View {
        TabView { // 📦 SwiftUI’s TabView = React Navigation's BottomTabNavigator

            // 🏠 Home Tab
            HomeView()
                .tabItem { // React Equivalent: <Tab.Screen name="Home" component={HomeView} />
                    Image(systemName: "house.fill") // React: <Ionicons name="home" />
                    Text("Home")
                }

            // 🔔 Notifications Tab
            NotificationsView(notificationCount: $notificationCount) // ✅ Passes binding (two-way data flow)
                .tabItem { // React: <Tab.Screen name="Notifications" component={NotificationsView} />
                    Image(systemName: "bell.fill") // React: <Ionicons name="notifications" />
                    Text("Notifications")
                }
                .badge(notificationCount) // 📩 Adds badge (like unread message count)

            // 🛠 Test Tab
            TestView()
                .tabItem {
                    Image(systemName: "hammer.fill") // React: <Ionicons name="construct" />
                    Text("Test")
                }
            
            // 👤 Profile Tab
            ProfileView()
                .tabItem {
                    Image(systemName: "person.fill") // React: <Ionicons name="person" />
                    Text("Profile")
                }
            
            // ⚙️ Settings Tab
            SettingsView()
                .tabItem {
                    Image(systemName: "gearshape.fill") // React: <Ionicons name="settings" />
                    Text("Settings")
                }
        }
        // .accentColor(.red) // 🔴 Changes the active tab color globally
    }
}

// (similar to Storybook in React)
#Preview {
    MainView() // ✅ This enables a live preview of MainView
}

/*
🚀 React vs SwiftUI Mapping:

1️⃣ @State private var notificationCount = 3
   - React Equivalent: const [notificationCount, setNotificationCount] = useState(3);

2️⃣ NotificationsView(notificationCount: $notificationCount)
   - React Equivalent: <NotificationsView notificationCount={notificationCount} setNotificationCount={setNotificationCount} />

3️⃣ .badge(notificationCount)
   - React Equivalent: Badge component in React Native Paper or custom badge using <View><Text>{notificationCount}</Text></View>

4️⃣ TabView
   - React Equivalent: BottomTabNavigator from React Navigation.

5️⃣ .tabItem { Image + Text }
   - React Equivalent: tabBarIcon and tabBarLabel in React Navigation’s tab options.

📌 Summary:
- `@State` in SwiftUI = `useState` in React.
- `@Binding` = Passing both `state` and `setState` down as props in React.
- `TabView` = BottomTabNavigator in React Navigation.
*/

