import SwiftUI

extension View {
    func rounded(cornerRadius: Double = 8) -> some View {
        //外型圓角
        clipShape(
            RoundedRectangle(
                cornerRadius: cornerRadius,
                style: .continuous
            )
        )
    }
}
