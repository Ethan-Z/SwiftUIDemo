//
//  TodoList.swift
//  KavsoftTutorial
//
//  Created by EthanZ on 2021/7/20.
//

import SwiftUI
import CoreData

struct TodoList: View {
    
    @Environment(\.presentationMode) var presentMode : Binding<PresentationMode>
    
    @State var edit = false
    @State var show = false
    
    @ObservedObject var model = TodoViewModel()
    
    @State var editItem : Todo = Todo()
    
    
    
    
    
    var body: some View {
        
        ZStack{
            
            Color.black.ignoresSafeArea(edges: .bottom)
            
            VStack(spacing: 10){
                
                VStack{
                    Spacer()
                        .frame(height: safeAreaInsets?.top)
                    
                    HStack{
                        
                        Button(action: {
                            presentMode.wrappedValue.dismiss()
                        }){
                            Image(systemName: "arrow.backward")
                                .foregroundColor(.black)
                                .frame(width: 23, height: 23)

                        }
                        
                        Text("ToDo")
                            .font(.title)
                            .fontWeight(.bold)
                        
                        Spacer()
                        
                        Button(action: {
                            
                            self.edit.toggle()
                            
                        }){
                            Text(self.edit ? "Done" : "Edit")
                                .font(.body)
                        }
                        
                        
                    }
                    .padding([.trailing, .leading], 15)
                    
                    
                    Button(action: {
                        self.editItem = self.model.createTodo()
                        
                        self.show.toggle()
                        
                    }){
                        Image(systemName: "plus")
                            .font(.title)
                            .foregroundColor(.white)
                            .frame(width: 40, height: 40)
                            .background(Color.red)
                            .clipShape(Circle())
                            
                    }
                    .padding(.top, -15)
                    .offset(y: 20)
                    
                    
    
                }
                .background(RectCornerShape(bottomCorner: CGSize(width: 25, height: 25)).fill(Color.white))
                // 这里不能用clipShape 这样会把 圆形按钮给截取掉
//                .clipShape(TodoListShape())
                
                
                ScrollView(.vertical, showsIndicators: false){
                    
                    ForEach(self.model.items){ item in
                        
                        TodoItemCell(edit: self.$edit, item: item){
                            self.model.delete(id: item.id ?? "")
                        }
                        .onTapGesture {
                            self.editItem = item
                            self.show = true
                        }
                        
                    }
                    
                }
                .padding(.top, 20)
            }
        }
        .ignoresSafeArea(.all)
        .navigationBarHidden(true)
        .sheet(isPresented: self.$show) {
            
            TodoEditView(show: self.$show, item: self.$editItem, model: self.model )
        }
        
    }
}




struct TodoEditView : View {
    
    @Binding var show : Bool
    @Binding var item : Todo
    @ObservedObject var model : TodoViewModel
    
//    var titleBinding: Binding<String> {
//        Binding<String>(
//            get: {
//                return self.item.title ?? ""
//        },
//            set: { newString in
//                self.item.title = newString
//        })
//    }
    
    var body: some View {
        
        VStack(alignment: .leading){
            
            HStack{
                Spacer()
                
                Button(action: {
                    self.show = false
                    if let id = self.item.id {
                        self.model.update(id: id, msg: self.item.msg, title: self.item.title)         
                    }else{
                        self.model.add(title: self.item.title, msg: self.item.msg)
                    }
                    
                }){
                    Text("Save")
                }
                
            }
            .padding()
            
            TextField("Title", text: self.$item.title.bound)
                .font(.title)
                .foregroundColor(.gray)
                .padding(.horizontal)
            
            Divider()
            
            TodoEditArea(text: self.$item.msg)
            
            
        }

        
        
    }
}


struct TodoEditArea: UIViewRepresentable {
  
  
    @Binding var text : String?
    
    func makeUIView(context: Context) -> UITextView{
        
        let textView = UITextView()
        textView.font = .systemFont(ofSize: 18)
        textView.text = text
        textView.delegate = context.coordinator
        
        return textView
    }
    
    func updateUIView(_ uiView: UITextView, context: Context) {
        uiView.text = text
    }
    
    func makeCoordinator() -> TodoEditArea.Coordinator {
        return TodoEditArea.Coordinator(parent: self)
    }
    
    class Coordinator: NSObject, UITextViewDelegate {
        let parent : TodoEditArea
        
        init(parent: TodoEditArea){
            self.parent = parent
        }
        
        func textViewDidChange(_ textView: UITextView) {
            self.parent.text = textView.text
            
        }
        
    }
    
}

struct TodoItemCell : View {
    
    @Binding var edit : Bool
    let item : Todo
    let deleteAction: () -> Void
    
    
    var body: some View {
        
        HStack {
            
            if self.edit {
                
                Button(action: {
                    self.deleteAction()
                }){
                    Image(systemName: "minus.circle")
                        .foregroundColor(Color.red)
                }
                
            }
            
            Text(item.title ?? "")
            
            Spacer()
            
            VStack(spacing: 5){
                Text(item.day ?? "")
                
                Text(item.time ?? "")
            }
        }
        .padding()
        .background(Color.white)
        .clipShape(RoundedRectangle(cornerRadius: 20))
        .padding(.horizontal)
        .padding(.top, 5)
        .animation(.spring())
    
        
    }
}


class TodoViewModel : ObservableObject {
    
    @Published var items : [Todo] = []
    
    private var viewContext : NSManagedObjectContext {
        let app = UIApplication.shared.delegate as! AppDelegate
        return app.persistentContainer.viewContext
    }
   
    
    
    init() {
        
        
//        let req = NSFetchRequest<NSFetchRequestResult>(entityName: "Todo")
        let req : NSFetchRequest<Todo> = Todo.fetchRequest()
        
        do {
            let res = try self.viewContext.fetch(req)
            for item in res {
            
//                let id = item.id!
//                let msg = item.msg ?? ""
//                let title = item.title ?? ""
//                let day = item.day ?? ""
//                let time = item.time ?? ""
//                let todoItem = TodoItem(id: id, title: title, msg: msg, time: time, day: day)
//                let todo = TodoItem(id: id, title: title, msg: msg, time: time, day: day)
                self.items.append(item)
            }
            
            
        } catch {
            print(error.localizedDescription)
        }
        
        
    }
    
    func createTodo() -> Todo {
        return Todo(context: self.viewContext)
    }
    
    func add(title: String?, msg: String?){
        let date = Date()
        
        let format = DateFormatter()
        format.dateFormat = "dd/MM/YY"
        let day = format.string(from: date)
        format.dateFormat = "hh:mm a"
        let time = format.string(from: date)
        let id = "\(date.timeIntervalSince1970)"
        
        //创建实例
//        let todo = NSEntityDescription.insertNewObject(forEntityName: "Todo", into: viewContext)
        let todo = Todo(context: self.viewContext)
        todo.id = id
        todo.day = day
        todo.msg = msg
        todo.title = title
        todo.time = time
        
        
        //写入实例
        do{
            try self.viewContext.save()
            self.items.append(todo)
        }catch{
            print(error.localizedDescription)
        }
        
    }
    
    
    func update(id: String, msg: String?, title: String?){
        
        let req : NSFetchRequest<Todo> = Todo.fetchRequest()
        
        do {
            let res = try self.viewContext.fetch(req)
            for item in res{
                if item.id == id{
                    item.msg = msg
                    item.title = title
                    try self.viewContext.save()
                    
                    for i in 0..<self.items.count{
                        let currentItem = self.items[i]
                        if currentItem.id == id{
                            currentItem.msg = msg
                            currentItem.title = title
                            self.items[i] = currentItem
                        }
                    }
                }
                
            }
 
        }
        catch{
            print(error.localizedDescription)
        }
    
    }
    
    
    func delete(id: String){
        
        let req : NSFetchRequest<Todo> = Todo.fetchRequest()
        
        do{
            let res = try viewContext.fetch(req)
            for item in res{
                if item.id == id{
                    viewContext.delete(item)
                    try viewContext.save()
                    
                    
                    
//                    for i in 0..<self.items.count {
//                        if  self.items[i].id == id {
//                            items.remove(at: i)
//                        }
//                    }
                    
                }
                
            }
        }
        catch{
            print(error.localizedDescription)
        }
    }
    
    
    
    
    
    
}

//
//struct TodoItem : Identifiable {
//
//    var id : String
//    var title : String
//    var msg : String
//    var time : String
//    var day : String
//
//}

extension Optional where Wrapped == String {
    var _bound: String? {
        get {
            return self
        }
        set {
            self = newValue
        }
    }
    public var bound: String {
        get {
            return _bound ?? ""
        }
        set {
            _bound = newValue.isEmpty ? nil : newValue
        }
    }
}



struct TodoList_Previews: PreviewProvider {
    static var previews: some View {
        TodoList()
    }
}
