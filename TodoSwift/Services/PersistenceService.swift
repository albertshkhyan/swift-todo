import Foundation

class PersistenceService {
    private let key = "savedTodos"

    func save(_ todos: [TodoItem]) {
        if let encoded = try? JSONEncoder().encode(todos) {
            UserDefaults.standard.set(encoded, forKey: key)
        }
    }

    func load() -> [TodoItem] {
        if let savedData = UserDefaults.standard.data(forKey: key),
           let decoded = try? JSONDecoder().decode([TodoItem].self, from: savedData) {
            return decoded
        }
        return []
    }
}
