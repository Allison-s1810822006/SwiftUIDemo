//浮動頁面
import SwiftUI

struct Popover_Demo: View {
    @State private var isShowing = false
    @State private var isShowingCover = false

    var body: some View {
        /// Refer to the examples in ``VStack_Demo``
        VStack {
            Button {
                isShowing = true
            } label: {
                Text("Show Popover")
            }
        }//這邊是單一頁面的按鈕
        
        .popover(
            isPresented: $isShowing,
            attachmentAnchor:
                    .point(.top),
            arrowEdge: .bottom
        ) {
            Text("Detail")
                .padding()
                .presentationCompactAdaptation(.none)
        }
        //錯誤示範，邏輯上有問題，popover與fullScreenCover，不能一起出來
        //fullScreenCover很少使用
        .fullScreenCover(
            isPresented: $isShowing){
                Image(systemName: "star fill")
                Button{
                    isShowingCover = false
                }
                label:{
                    Text("Hide Cover")
                }
            }
        }
    }


#Preview {
    Popover_Demo()
}
