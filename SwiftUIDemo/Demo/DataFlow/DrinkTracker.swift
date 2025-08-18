import SwiftUI
/// 寫文檔說明
struct DrinkTracker: View {
    
    //為何要定義view，讓struct去爪程式碼的改變
    @State private var waterCount: Int = 0//var是變量，變量名稱大小寫的命名有規範
    @State private var coffeeCount: Int = 0//＠State做狀態管理，狀態的根源
    @State private var beerCount: Int = 0//有＝事可保存的變量

    private var totalCount: Int {//這邊的var變量是計算的
        waterCount + coffeeCount + beerCount
    }

    var body: some View {
        let _ = Self._printChanges()
        VStack {//VStack是view的子類，VStack垂直的
            Text("Total number of drinks: \(totalCount)")
            WaterTracker(count: $waterCount)//WaterTracker更新子類，因為重複要寫＄
            CoffeeTracker(count: $coffeeCount)
            BeerTracker(count: $beerCount)
            Spacer()
        }
        .padding()
    }
}

struct WaterTracker2: View {
    @State var count: Int = 0

    var body: some View {
        HStack {//HStack橫向的
            Text("^[\(count) glass](inflect: true) of water")//inflect:
            Stepper("", value: $count)//Stepper＋１－１。
        }
        .padding()
    }
}

struct WaterTracker: View {
    @Binding var count: Int//@Binding，外面的值更新到這邊，無需＝因為沒有存值，外面更動裡面會同步

    var body: some View {
        HStack {
            
            Text("^[\(count) glass](inflect: true) of water")
            Stepper("", value: $count)
        }
        .padding()
    }
}

struct CoffeeTracker: View {
    @Binding var count: Int

    var body: some View {
        HStack {
            Text("^[\(count) cup](inflect: true) of coffee")
            Stepper("", value: $count)
        }
        .padding()
    }
}

struct BeerTracker: View {
    @Binding var count: Int

    var body: some View {
        HStack {
            Text("^[\(count) glass](inflect: true) of beer")
            Stepper("", value: $count)
        }
        .padding()
    }
}

struct DrinkView: View {
    private let symbolName: String = "cup.and.saucer"

    var body: some View {
        Image(systemName: symbolName)
            .imageScale(.large)
            .font(.title)
            .foregroundStyle(.blue)
    }
}

#Preview("Drink") {
    DrinkView()
}

#Preview("Water Tracker") {
    WaterTracker2()
}

#Preview("Drink Tracker") {
    DrinkTracker()
}
