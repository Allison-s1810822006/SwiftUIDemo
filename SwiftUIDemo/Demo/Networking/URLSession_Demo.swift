import SwiftUI

// 1. URLSession
// 2. Error Handling (do-catch)
// 3. Swift Concurrency (async / await)
// 4. Task
// 5. @MainActor
// 6. Codable
// 7. JSONDecoder

struct URLSession_Demo: View {
    // State to hold our data
    @State private var joke = "Tap to load a joke"
    @State private var isLoading = false
    
    var body: some View {
        VStack(spacing: 20) {
            // Display the joke
            Text(joke)
                .padding()
                .background(.blue.opacity(0.1), in: RoundedRectangle(cornerRadius: 8))
            
            // Button to fetch data
            Button("Fetch Joke") {
                // Call our async function
                //Task去做新的任務
                Task {
                    //更新狀態，有在祖先層做更新，最後完整結束
                    await loadJoke()
                }
            }
            .disabled(isLoading)
        }
        .padding()
        .navigationTitle("URLSession Demo")
    }
    
    // Simple async function to fetch data
    //@MainActor(祖先層上面發生)：ＡＰＰ在開發週期，只能在祖先層發生。
    //要在UIFram上面跑，不然之後跑可能畫面會沒有同步發生。
    @MainActor
    //loadJoke:用async
    private func loadJoke() async {
        isLoading = true
//        網路請求
        do {
            //copy那段連結，在網站上，會出現json的格式
            //json:裡面有key跟值、可以放陣列，可以多個封裝
            //xml與json是他的延伸
            //與longSQL串連
            // 1. Create URL
            let url = URL(string: "https://official-joke-api.appspot.com/random_joke")!
            
            //shared:訪問到同一個實體，無需在建新的，無需在ＡＰＰ裡建構多個實例，會保存在記憶體裡，佔一些空間
            //data(from: url)：訪問網站
            //訪問網站
            //try:有拋出錯誤。
            // 2. Fetch data using URLSession
            //data
            let (data, _) = try await URLSession.shared.data(from: url)
            
            //JSONDecoder:
            // 3. Decode JSON
            let jokeData = try JSONDecoder().decode(JokeResponse.self, from: data)
            
            //有在祖先層做更新，最後完整結束
            // 4. Update UI
            joke = "\(jokeData.setup)\n\n\(jokeData.punchline)"
            
        } catch is DecodingError {
            joke = "DecodingError"
        } catch let error{
            // Handle errors
            print(error)
            joke = "Failed to load joke: \(error.localizedDescription)"
        }
        
        isLoading = false
    }
}

// Simple model for our data
//Codable:
//可寫Decode\Encode，但只放一個就Codable就好
//有Codable才能用JSONDecoder
struct JokeResponse: Codable {
    let setup: String    // Joke setup
    let punchline: String // Joke punchline
    let status:String
}

#Preview {
    NavigationStack {
        URLSession_Demo()
    }
}
