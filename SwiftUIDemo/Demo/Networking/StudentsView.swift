//
//  StudentsView.swift
//  SwiftUIDemo
//
//  Created by Harry Ng on 8/18/25.
//

import SwiftUI

struct StudentsView: View {
    @State var students: [Student] = []

    var body: some View {
        List(students) {
            Text("Name: \($0.name)")
        }
        .task {
            await loadStudents()
        }
    }

    func loadStudents() async {
        do {
            let baseURL = "https://learnify-api.zeabur.app"

            // 1. URL
            guard let url = URL(string: "\(baseURL)/api/auto/students") else {
                return // early return
            }

            // 2. URLSession get students from server
            let (data, _) = try await URLSession.shared.data(from: url)

            // 3. Decode json
            let jsonResponse = try JSONDecoder().decode(JSONResponse.self, from: data)

            // 4. Display in UI
            self.students = jsonResponse.data.students
        } catch {
            print("Error: \(error.localizedDescription)")
        }
    }
}

struct JSONResponse: Codable {
    var success: Bool
    var data: JSONData
}

struct JSONData: Codable {
    var students: [Student]
}

struct Student: Codable, Identifiable {
    var id: String
    var full_name: String

    var name: String {
        full_name
    }
}

#Preview {
    StudentsView()
}
