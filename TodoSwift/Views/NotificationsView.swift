import SwiftUI

// 📌 NotificationsView is a child component that receives `notificationCount` from its parent via @Binding
// React Equivalent: function NotificationsView({ notificationCount, setNotificationCount }) {...}
struct NotificationsView: View {
    @Binding var notificationCount: Int // ✅ @Binding allows this view to modify the parent's state
    // React Equivalent: props.notificationCount (but with ability to modify, similar to useState in parent)

    var body: some View {
        VStack {
            // 🛎️ Notification Title
            Text("🔔 Notifications")
                .font(.largeTitle)

            // 🛑 Clear Notification Button
            Button(action: {
                // ✅ Decrement notification count when the button is pressed
                if notificationCount > 0 {
                    notificationCount -= 1 // 🔥 Modifies parent state via @Binding
                }
            }) {
                // 📌 Button UI
                Text("Clear a Notification")
                    .padding()
                    .background(Color.blue) // 🎨 Button color
                    .foregroundColor(.white) // ✅ White text
                    .cornerRadius(10) // 🔳 Rounded corners
            }
        }
    }
}

#Preview {
    // ✅ Wrapping NotificationsView with a parent state using @State
    StatefulPreviewWrapper(5) { notificationCount in
        NotificationsView(notificationCount: notificationCount)
    }
}

// ✅ Helper for providing @Binding in Previews
struct StatefulPreviewWrapper<Value>: View {
    @State private var value: Value
    private let content: (Binding<Value>) -> AnyView

    init(_ initialValue: Value, content: @escaping (Binding<Value>) -> AnyView) {
        _value = State(initialValue: initialValue)
        self.content = content
    }

    init(_ initialValue: Value, content: @escaping (Binding<Value>) -> some View) {
        _value = State(initialValue: initialValue)
        self.content = { binding in AnyView(content(binding)) }
    }

    var body: some View {
        content($value)
    }
}

/*
🔹 React Analogy for This Component:

```jsx
function NotificationsView({ notificationCount, setNotificationCount }) {
    return (
        <div>
            <h1>🔔 Notifications</h1>
            <button onClick={() => {
                if (notificationCount > 0) setNotificationCount(prev => prev - 1);
            }}>
                Clear a Notification
            </button>
        </div>
    );
}
*/
