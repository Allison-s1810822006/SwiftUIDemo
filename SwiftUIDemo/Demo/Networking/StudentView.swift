//
//  StudentView.swift
//  SwiftUIDemo
//
//  Created by 訪客使用者 on 2025/8/18.
//
import SwiftUI

struct StudentView:View{
    @State var students: [Student] = []
    
    var body : some View{
        List(students){
            Text("Name: \($0.name)")
        }
        .task {
            await loasStudent()
        }
    }
    func loadStudents() async{
        do {
            let baseURL =
            "https://learnify-api.zeabur.app  "
            //1.URL
            guard let url = URL(string: "") else {
                return // early return
            }
            //2.URLSession get  students feom server
            let (data,response) = try await
            URLSession.shard.data(from:url)
            print()
            //3.Decode json
            let students = try
            JSONDecoder()
                .decode(JSONRespones.self)
        from:
        }
    }
}
struct JSONData:Codable{
    var
}

struct Student: Codable, Identifiable{
    var id: String
    var name: String
    
    var name: String{
        fullname
    }
}
#Preview {
    StudentView()
}
