import SwiftUI

struct NavigationStack_Demo: View {
    var body: some View {
        NavigationStack {
            List {
                NavigationLink(value: 1) {
                    Text("可愛動物 1🦊")
                }
                NavigationLink(value: 2) {
                    Text("可愛動物 2🐶")
                }
                NavigationLink(value: 3) {
                    Text("可愛動物 3🐱")
                }
                NavigationLink(value: 3) {
                    Text("可愛動物 ４🐻")
                }
                NavigationLink(value: 3) {
                    Text("可愛動物 ５🐯")
                }
            }
            //navigationTitle監控
            .navigationTitle("Actions")
            .navigationDestination(for: Int.self) { value in
                
//                if value == 1{
//                    Image(systemName: "book.pages")
//                          }
                          
                          switch value{
                    case 1:
                        Image(systemName: "book.pages")
                    case 2...5:
                        Image(systemName: "book")
                    default:
                        EmptyView()
                    }
                Text("Detail View \(value)")
                //"""多行表示的意思
//                Text("""
//                ABC
//                DEF
//                GHI
//                """)
            }
        }
    }
}

#Preview("Navigation") {
    NavigationStack_Demo()
}

/// Navigation Path
struct NavigationStack_Demo2: View {
    //NavigationPath「路徑堆疊」，用來記錄你導航過的頁面
    @State private var path: [String] = []

    var body: some View {
        NavigationStack(path: $path) {
            List {
                NavigationLink(value: "Detail") {
                    Text("Show Detail")
                }
            }
            .navigationTitle("Actions")
            .navigationDestination(for: String.self) { value in
                VStack {
                    Text("Detail View")

                    Button("Push") {
                        path.append("Detail")
                    }

                    if path.count >= 3 {
                        Button("Pop to root") {
                            path = []
                        }
                    }
                }
            }
        }
    }
}

#Preview("NavigationPath") {
    NavigationStack_Demo2()
}
