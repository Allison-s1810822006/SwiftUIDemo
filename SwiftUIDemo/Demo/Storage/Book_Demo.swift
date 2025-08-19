//
//  Book_Demo.swift
//  SwiftUIDemo
//
//  Created by 訪客使用者 on 2025/8/19.
//定義書名，會有字符串
import SwiftData
import SwiftUI

@Model
class SwiftBook {
    var name:String
    
    init(name: String) {
        self.name = name
    }
}

struct Books_Demo: View {
    var body: some View {
        BookInternal()
            .modelContainer(for: SwiftBook.self)
    }
}
        
struct BookInternal:View {
    @Query var books:[SwiftBook]
    @Environment(\.modelContext) var modelContext
    
    
    var body: some View {
        NavigationStack {
            Text("Count:\(books.count)")
            List(books) { book in Text("Book: \(book.name)")
            }
            .toolbar{
                ToolbarItem {
                    Button("Add Sample Books") { addSampleBooks()
                    }
                }
            }
        }
    }
    
    func addSampleBooks() {
        let books: [SwiftBook] = [
            SwiftBook(name:"SwiftUI"),
            SwiftBook(name:"Swift"),
            SwiftBook(name:"Councurrency"),
        ]
        for book in books {
            modelContext.insert(book)
        }
    }
}
    
    

#Preview {
    Books_Demo()
//    //modelContainer:跟系統告知這邊要讀取SwiftBook
//        .modelContainer(for: SwiftBook.self)
}
