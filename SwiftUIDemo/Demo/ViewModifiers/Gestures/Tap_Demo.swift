import SwiftUI

struct Tap_Demo: View {
    @State private var isTapped: Bool = false
    @State private var isLongPressed: Bool = false

    var body: some View {
        Image("pencake")
            .resizable()
        //scaledToFit比例保持
            .scaledToFit()
        //frame(width：尺寸大小）
            .frame(width: isTapped ? 300 : 200)
        //on什麼時候發生
            //.onTapGesture {
                //toggle觸及有效果
                //isTapped.toggle(
                    .animation(.default,value:isTapped)
                    .onTapGesture(count:2){
//                        function
//                        block
//                        Trailing closure
                        isTapped.toggle()
                        }
        //opacity透明度
                    .opacity(isLongPressed ? 0.5 : 1)
                    .onLongPressGesture {
                        print("long")
                        isLongPressed.toggle()
                        let _ = Self._printChanges()
        }
//                    onTapGesture(count: 1,perform: {
//                        isTapped.toggle()
//                    })
//                    onTapGesture (perform: {
//                        isTapped.toggle()
//                                  })
//                    onTapGesture (perform: {
//                        isTapped.toggle()
//                      })
            
    }
}

#Preview("Tap to zoom") {
    Tap_Demo()
}

#Preview("Zoomable") {
    Image("pencake")
        .resizable()
        .scaledToFit()
        .rounded()
        .frame(width: 200)
        .zoomable()
}
