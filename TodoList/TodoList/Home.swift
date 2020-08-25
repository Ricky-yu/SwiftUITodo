//
//  Home.swift
//  TodoList
//
//  Created by CHEN SINYU on 2020/08/25.
//  Copyright © 2020 CHEN SINYU. All rights reserved.
//

import SwiftUI

var editingMode: Bool = false
var editingTodo: Todo = emptyTodoItem
var editingIndex: Int = 0
var detailShouldUpdateTitle: Bool = false

class Main: ObservableObject {
    @Published var todos: [Todo] = []
    @Published var detailsShowing: Bool = false
    @Published var detailsTitle: String = ""
    @Published var detialsDueDate: Date = Date()
    
    func sort() {
        self.todos.sort(by: { $0.dueDate.timeIntervalSince1970 < $1.dueDate.timeIntervalSince1970})
        for i in 0 ..< self.todos.count {
            self.todos[i].i = i
        }
    }
}


struct Home: View {
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}
