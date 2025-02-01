import SwiftUI
import Foundation // Required for IndexSet, UserDefaults, UUID, Codable

/*
 📝 **TodoViewModel in Swift = React State Management (like Context API, useReducer, or Redux)**

 - **ObservableObject** = React’s **Context API Provider** or global state manager.
 - **@Published** = Triggers UI updates, similar to React's **useState** or **useReducer**.
 - **PersistenceService** = Acts like **localStorage** in React for data persistence.
*/

// This is like useTodoViewModel
class TodoViewModel: ObservableObject { // 🧠 Global state management (like Context API Provider)
    @Published var todos: [TodoItem] = [TodoItem(title: "Sample Task")]  // ✅ Default task like useState(["Sample Task"])

    private let persistence = PersistenceService() // For saving/loading tasks (like localStorage)

    init() {
        print("✅ TodoViewModel initialized")
        todos = persistence.load()  // 🚀 Load saved tasks when the app starts
        print("📌 Loaded todos: \(todos)")
    }

    func addTodo(title: String) { // ➕ Add new task
        let newTodo = TodoItem(title: title)
        todos.append(newTodo)  // ✅ Updates the list (like setState([...prev, newTask]))
        print("✅ Task Added: \(title)")
        saveTodos()  // 💾 Save changes to persistence
    }

    func toggleCompletion(todo: TodoItem) { // ✅ Toggle task completion (like updating state in React)
        // [5, 2, 8, 1, 9].sort((a, b) => b - a); // Similar to $0 > $1
        // $0 = First parameter
        // $1 = Second parameter
        if let index = todos.firstIndex(where: { $0.id == todo.id }) {// current item - $0.id
            todos[index].isCompleted.toggle()  // 🔄 Toggle completion status
            print("🔄 Task Toggled: \(todo.title) - Completed: \(todos[index].isCompleted)")
            saveTodos()  // 💾 Save updated status
        }
    }

    func deleteTodo(at offsets: IndexSet) {  // 🗑️ Delete tasks
        offsets.forEach { index in
            print("🗑️ Task Deleted: \(todos[index].title)")
        }
        todos.remove(atOffsets: offsets)  // ❌ Remove task (like filtering out in React)
        saveTodos()  // 💾 Save updated list
    }

    private func saveTodos() {  // 💾 Save tasks to persistence
        let todosString = todos.map { "📌 Task: \($0.title) | Completed: \($0.isCompleted)" }
                                .joined(separator: "\n")
        print("💾 Saving todos:\n\(todosString)")
        persistence.save(todos)
    }
}
