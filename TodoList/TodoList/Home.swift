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
    @Published var detailsDueDate: Date = Date()
    
    func sort() {
        self.todos.sort(by: { $0.dueDate.timeIntervalSince1970 < $1.dueDate.timeIntervalSince1970})
        for i in 0 ..< self.todos.count {
            self.todos[i].i = i
        }
    }
}
func aaa() {
  let num = 21
    num=23
}
struct Home: View {
    @ObservedObject var main: Main
    var body: some View {
        ZStack {
            TodoList(main: main)
                .blur(radius: main.detailsShowing ? 10 : 0)
            Button(action: {
                editingMode = false
                editingTodo = emptyTodoItem
                detailShouldUpdateTitle = true
                self.main.detailsTitle = ""
                self.main.detailsDueDate = Date()
                self.main.detailsShowing = true
            }) {
                btnAdd()
            }.offset(x:UIScreen.main.bounds.width/2-60, y:UIScreen.main.bounds.height/2-80)
            .blur(radius: main.detailsShowing ? 10 : 0)
            TodoDetails(main: main)
                .offset(x:0,y: main.detailsShowing ? 0 : UIScreen.main.bounds.height)
        }
    }
}

struct btnAdd: View {
    var size: CGFloat = 65.0
    var body: some View {
        ZStack{
            Group {
                Circle()
                    .fill(Color("btnAdd-bg"))
            }.frame(width: self.size, height: self.size)
                .shadow(color: Color("btnAdd-shadow"), radius: 10)
            Group {
                Image(systemName: "plus.circle.fill")
                .resizable()
                    .frame(width:self.size, height: self.size)
                .foregroundColor(Color("theme"))
            }
        }
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home(main: Main())
    }
}
