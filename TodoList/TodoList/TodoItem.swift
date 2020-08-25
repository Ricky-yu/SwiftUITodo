//
//  TodoItem.swift
//  TodoList
//
//  Created by CHEN SINYU on 2020/08/25.
//  Copyright © 2020 CHEN SINYU. All rights reserved.
//

import SwiftUI

class Todo : NSObject, NSCoding {
    func encode(with coder: NSCoder) {
        coder.encode(self.title, forKey: "title")
        coder.encode(self.dueDate, forKey: "dueDate")
        coder.encode(self.checked, forKey: "checked")
    }
    
    required init?(coder: NSCoder) {
        self.title = coder.decodeObject(forKey: "title") as? String ?? ""
        self.dueDate = coder.decodeObject(forKey: "dueDate") as? Date ?? Date()
        self.checked = coder.decodeObject(forKey: "checked") as? Bool ?? false
    }
 
    var title: String = ""
    var dueDate: Date = Date()
    var checked: Bool = false
    var i: Int = 0
    
    init(title: String, dueDate: Date) {
        self.title = title
        self.dueDate = dueDate
    }
}
var emptyTodoItem: Todo = Todo(title: "", dueDate: Date())


struct TodoItem: View {
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

struct TodoItem_Previews: PreviewProvider {
    static var previews: some View {
        TodoItem()
    }
}
