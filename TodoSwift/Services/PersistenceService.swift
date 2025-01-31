import Foundation

/*
 📝 What is UserDefaults in Swift?
 UserDefaults is a simple key-value storage system in Swift, mainly used for saving small amounts of data persistently (even after the app is closed and reopened). It’s similar to localStorage in JavaScript.
 
 
 let defaults = UserDefaults.standard

 // 🔹 Save Data
 defaults.set("Albert", forKey: "username")

 // 🔹 Retrieve Data
 let username = defaults.string(forKey: "username")
 print(username ?? "No username found") // Output: Albert
*/

//PersistenceService in React (Using Local Storage)
class PersistenceService {
    private let key = "savedTodos"

    func save(_ todos: [TodoItem]) {// ✅ Save todos to UserDefaults
        // localStorage.setItem(this.key, JSON.stringify(todos));
        // (try...catch ) try? ensures that if the encoding fails, it doesn't crash the app but instead returns nil.
        if let encoded = try? JSONEncoder().encode(todos) {// tries to convert the todos array into JSON data.
            UserDefaults.standard.set(encoded, forKey: key)
        }
        /*
         let encoded;
         try {
             encoded = JSON.stringify(todos);
         } catch (error) {
             console.error("Failed to encode todos:", error);
             encoded = null; // Fallback to null if encoding fails
         }
         
         JSONEncoder() - JSON
         encode(obj) - stringify(obj)
         
         let encoder = JSONEncoder() === const encoder = JSON.stringify;
        */
    }

    func load() -> [TodoItem] {// ✅ Load todos from UserDefaults
        if let savedData = UserDefaults.standard.data(forKey: key),
           let decoded = try? JSONDecoder().decode([TodoItem].self, from: savedData) {
            return decoded
        }
        return []
    }
}
