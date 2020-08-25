//
//  TodoList.swift
//  TodoList
//
//  Created by CHEN SINYU on 2020/08/25.
//  Copyright © 2020 CHEN SINYU. All rights reserved.
//

import SwiftUI
var exampleTodos: [Todo] = [
    Todo(title: "Shopping", dueDate: Date()),
    Todo(title: "Watch TV", dueDate: Date()),
    Todo(title: "Sleep", dueDate: Date()),
    Todo(title: "Do HomeWork", dueDate: Date()),
    Todo(title: "Dinner", dueDate: Date())
]

struct TodoList: View {
    @ObservedObject var main: Main
    var body: some View {
        NavigationView {
            ScrollView {
                ForEach(main.todos) { todo in
                    VStack {
                        if todo.i == 0 ||
                            formatter.string(from: todo.dueDate) != formatter.string(from: self.todos[todo.i - 1].dueDate)
                            {
                                HStack {
                                    Spacer().frame(width: 30)
                                    Text(date2Word(date: todo.dueDate))
                                    Spacer().frame(width: 30)
                                }
                            }
                        HStack {
                            Spacer().frame(width: 20)
                            TodoItem(main: main, todoIndex: .constant(todo.i))
                                .cornerRadius(10)
                                .clipped()
                                .shadow(color: Color("todoItemShadow"), radius: 5)
                            Spacer().frame(width: 20)
                        }
                        Spacer().frame(width: 20)
                    }
                }
            }
            .edgesIgnoringSafeArea(.bottom)
            .navigationBarTitle(Text("TodoList"))
            .onAppear{
                //初期化時Todoデータ設定する
                if let data = UserDefault.standard.object("todos") as? Data {
                    let todoList = NSKeyedUnarchiver.unarchiveObject(with: data) as? [Todo] ?? []
                    for todo in todoList {
                        if !todo.checked {
                            self.main.todos.append(todo)
                        }
                    }
                } else {
                    self.main.todos = exampleTodos
                    self.main.sort()
                }
            }
        }
    }
}

struct TodoList_Previews: PreviewProvider {
    static var previews: some View {
        TodoList(main: Main())
    }
}
