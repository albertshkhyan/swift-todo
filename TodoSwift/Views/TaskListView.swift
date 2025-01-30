import SwiftUI

struct TaskListView: View {
    @ObservedObject var viewModel: TodoViewModel
    @State private var newTaskTitle = ""  // ✅ State for input field

    var body: some View {
        NavigationView {
            VStack {
                HStack {
                    TextField("Enter new task", text: $newTaskTitle)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .padding()
                    
                    Button(action: {
                        if !newTaskTitle.isEmpty {
                            viewModel.addTodo(title: newTaskTitle)  // ✅ Add task
                            newTaskTitle = ""  // ✅ Clear input field
                        }
                    }) {
                        Image(systemName: "plus.circle.fill")
                            .font(.largeTitle)
                            .foregroundColor(.blue)
                    }
                    .padding(.trailing)
                }

                if viewModel.todos.isEmpty {
                    Text("No tasks available")
                        .font(.title)
                        .foregroundColor(.gray)
                        .padding()
                } else {
                    List {
                        ForEach(viewModel.todos) { todo in
                            HStack {
                                Text(todo.title)
                                    .strikethrough(todo.isCompleted, color: .gray)
                                Spacer()
                                Button(action: { viewModel.toggleCompletion(todo: todo) }) {
                                    Image(systemName: todo.isCompleted ? "checkmark.circle.fill" : "circle")
                                        .foregroundColor(todo.isCompleted ? .green : .gray)
                                }
                            }
                        }
                        .onDelete(perform: viewModel.deleteTodo)
                    }
                }
            }
            .navigationTitle("Todo List")
            .toolbar {
                #if os(iOS)
                EditButton()
                #endif
            }
        }
    }
}
