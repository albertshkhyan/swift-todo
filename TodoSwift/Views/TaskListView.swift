import SwiftUI


/*
 https://docs-assets.developer.apple.com/published/ce0ca452c3bcccf11149a8728f1c489f/Building-Layouts-with-Stack-Views-1@2x.png
 HStack {}    Horizontal (Row)    display: flex; flexDirection: "row"
 VStack {}    Vertical (Column)    display: flex; flexDirection: "column"
 ZStack {}    Overlapping views    position: absolute; top/left
 
 Example:
 HStack {
     Text("Task 1")
     Text("Task 2")
     Text("Task 3")
 }
 
 React Equivalent (Using Flexbox)
 <div style={{ display: "flex", flexDirection: "row" }}>
     <p>Task 1</p>
     <p>Task 2</p>
     <p>Task 3</p>
 </div>
*/

struct TaskListView: View {
    @ObservedObject var viewModel: TodoViewModel
    @State private var newTaskTitle = ""  // ✅ State for input field

    var body: some View {
        NavigationView {
            VStack {
                HStack {//Horizontal (Row): HStack is similar to a div with display: flex; flexDirection: "row".
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
