import SwiftUI
import Observation

struct Counter: View {
    @Binding var count: Int

    var body: some View {
        Text("Counter: \(count)")
        Button("Reset") {
            count = 0
        }
    }
}

struct ModelCounter: View {
    var model: Model

    var body: some View {
        Button("Set to 100") {
            model.count = 100
        }
    }
}

struct CounterView: View {
    @State var model = Model()

    var body: some View {
        Button("Increment \(model.count)") {
            model.count += 1
        }

        Divider()

        Counter(count: $model.count)

        Divider()

        ModelCounter(model: model)
            .onAppear(perform: onAppear)
    }
}
//CounterView+Lifecycle.swift
extension CounterView{
    func onAppear(){
    
    }
}

@Observable
class Model {
    var count: Int = 0
}

#Preview {
    CounterView()
        .font(.largeTitle)
}
