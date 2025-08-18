import SwiftUI

struct Drag_Demo: View {
    //CGSize:大小
    @State private var position = CGSize.zero         // Final position (saved)
    
    @State private var dragOffset = CGSize.zero
    // Offset during drag
    

    var body: some View {
        Circle()
            .fill(Color.blue)
            .frame(width: 100, height: 100)
        //這邊是監控
            .offset(x: position.width + dragOffset.width,
                    y: position.height + dragOffset.height)
            //gesture：手勢，但這邊還沒定義要如何顯示
       
            .gesture(
                
                DragGesture()
                    .onChanged { value in
                        //translation：也是CGSize
                        dragOffset = value.translation
                    }
                //onEnded：手放開發生的事
                    .onEnded { value in
                        position.width += value.translation.width
                        position.height += value.translation.height
                        withAnimation(.linear(duration:2)){
                            dragOffset = .zero
                        }
                        
                    }
            )
            .animation(.spring(), value: position)
    }
    
}

#Preview {
    Drag_Demo()
}
