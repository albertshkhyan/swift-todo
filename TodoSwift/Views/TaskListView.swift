import SwiftUI

/*
 🔗 **SwiftUI Stack Views with React Flexbox Equivalent:**

 - `HStack {}` → Horizontal Stack (like `display: flex; flexDirection: "row"` in React)
 - `VStack {}` → Vertical Stack (like `display: flex; flexDirection: "column"`)
 - `ZStack {}` → Overlapping Views (similar to `position: absolute` in CSS)

 Example in SwiftUI:
 HStack {
     Text("Task 1")
     Text("Task 2")
     Text("Task 3")
 }

 React Equivalent (Using Flexbox):
 <div style={{ display: "flex", flexDirection: "row" }}>
     <p>Task 1</p>
     <p>Task 2</p>
     <p>Task 3</p>
 </div>
*/

struct TaskListView: View {
    @ObservedObject var viewModel: TodoViewModel // ✅ Observes changes in the Todo list
    @State private var newTaskTitle = ""         // ✅ Local state for handling new task input

    var body: some View {
        NavigationView {
            VStack { // 📦 Acts like a vertical container (flexDirection: "column" in React)

                // 🚀 **Input & Add Task Section (similar to a form in React)**
                HStack { // ➡️ Horizontal Stack (display: flex; flexDirection: "row")
                    TextField("Enter new task", text: $newTaskTitle) // 📥 Controlled Input (like useState binding)
                        .textFieldStyle(RoundedBorderTextFieldStyle()) // 🎨 Adds border styling
                        .padding()

                    Button(action: {
                        if !newTaskTitle.isEmpty {
                            viewModel.addTodo(title: newTaskTitle)  // ➕ Adds new task to the list
                            newTaskTitle = ""                       // 🔄 Clears input field
                        }
                    }) {
                        Image(systemName: "plus.circle.fill")        // ➕ Icon for the Add button
                            .font(.largeTitle)
                            .foregroundColor(.blue)
                    }
                    .padding(.trailing)
                }

                // 🚩 **Conditional Rendering (like React's { condition && <Component /> })**
                if viewModel.todos.isEmpty {
                    Text("No tasks available") // 😴 Placeholder if the list is empty
                        .font(.title)
                        .foregroundColor(.gray)
                        .padding()
                } else {
                    // 📋 **Todo List (like mapping through an array in React)**
                    List {
                        ForEach(viewModel.todos) { todo in // 🔁 React Equivalent: todos.map(todo => <div>{todo.title}</div>)
                            HStack {
                                Text(todo.title)
                                    .strikethrough(todo.isCompleted, color: .gray) // ✅ Shows strikethrough if completed
                                Spacer() // ⬅️ Pushes content to the left
                                Button(action: { viewModel.toggleCompletion(todo: todo) }) {
                                    Image(systemName: todo.isCompleted ? "checkmark.circle.fill" : "circle") // ✅ Toggling completion
                                        .foregroundColor(todo.isCompleted ? .green : .gray)
                                }
                            }
                        }
                        .onDelete(perform: viewModel.deleteTodo) // ❌ Swipe-to-delete functionality
                    }
                }
            }
            // navigationTitle("Home")    name="Home" in Stack.Screen    Sets the screen title
            .navigationTitle("Todo List") // 🗂️ Navigation bar title
            .toolbar { // 🛠️ Toolbar for additional actions
                #if os(iOS)
                // ✏️ Automatically toggles between "Edit" and "Done"
                EditButton() // ✏️ Edit button to enable swipe-to-delete
                #endif
            }
        }
    }
}

// ✅ **Preview Provider for Xcode Canvas Preview**
#Preview {
    TaskListView(viewModel: TodoViewModel()) // 🔍 Preview with sample data
}
