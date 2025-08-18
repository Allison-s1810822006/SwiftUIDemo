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
            let (data,_) = try await
            URLSession.shard.data(from:url)
    
            //3.Decode json
            let students = try
            JSONDecoder().decode(JSONRespones.self,from: data)
            
            
            //4.Display in UI
            self.students = JsonResponse.data.students
        }catch{
            print("Error:\(error.localizedDescription)")
        }
    }
}
struct JSONResponse : Codable{
    var success : Bool
    var data : JSONData
}
                  
struct JSONData:Codable{
    var students: [Student]
}

struct Student: Codable, Identifiable{
    var id: String
    var full_name: String
    
//    var name: String{
//        fullname
//    }
}
#Preview {
    StudentView()
}
