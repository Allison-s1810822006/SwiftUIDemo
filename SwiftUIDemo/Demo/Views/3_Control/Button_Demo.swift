import SwiftUI

//struct Button_Demo: View {
//    @State private var isPressesed = false
//    var body: some View {
//        Button {
//            // save book to favorites
//            //isPressed點選改變語法
//            print("Button tapped :\(isPressed)")
//            isPressesed.toggle()
//        } label: {
//            Label("Add to Favorites"(systemImage: isPressed ? "star" :"star fill")
//                .foregroundStyle(isPressed ? .black : .white)
//                .padding()
//                .frame(width: 300, height: 300)
//                .background(
//                    RadialGradient(
//                        gradient: Gradient(colors: [isPressed ？ .green : .blue, .purple]),
//                        center: .center,
//                        startRadius: 10,
//                        endRadius: 200
//                    )
//                )
////                .background(isPressesed ?.yellow : .gray)
//               //?代表true or flase
//                .cornerRadius(isPressesed ? 8 : 20)
//        }
//    }
//}
//上課示範
struct CustomButton:View {
    @State private var isPressed = false

    var body : some View {
        Button {
            print("Button tapped :\(isPressed)")
            isPressed.toggle()
        } label: {
            Text("Tap me")
                .font(.title)
                .foregroundStyle(isPressed ?.green : .red)//?代表true or flase
        }
    }
}

#Preview {
//    Button_Demo()
    CustomButton()
}
