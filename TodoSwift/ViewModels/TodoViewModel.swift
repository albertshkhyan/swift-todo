import SwiftUI
import Foundation // import for recognized IndexSet, UserDefaults, UUID, Codable

class TodoViewModel: ObservableObject {
    @Published var todos: [TodoItem] = [TodoItem(title: "Sample Task")]  // ✅ Added default task

    private let persistence = PersistenceService()

    init() {
        print("✅ TodoViewModel initialized") // N:2
        todos = persistence.load()
        print("📌 Loaded todos: \(todos)")// N:3
    }

    func addTodo(title: String) {
        let newTodo = TodoItem(title: title)
        todos.append(newTodo)
        print("✅ Task Added: \(title)")
        saveTodos()
    }

    func toggleCompletion(todo: TodoItem) {
        if let index = todos.firstIndex(where: { $0.id == todo.id }) {
            todos[index].isCompleted.toggle()
            print("🔄 Task Toggled: \(todo.title) - Completed: \(todos[index].isCompleted)")
            saveTodos()
        }
    }

    func deleteTodo(at offsets: IndexSet) {  // ✅ Now IndexSet is recognized
        offsets.forEach { index in
            print("🗑️ Task Deleted: \(todos[index].title)")
        }
        todos.remove(atOffsets: offsets)
        saveTodos()
    }

    private func saveTodos() {
        let todosString = todos.map { "📌 Task: \($0.title) | Completed: \($0.isCompleted)" }
                                .joined(separator: "\n")
        print("💾 Saving todos:\n\(todosString)")
        persistence.save(todos)
    }
}
