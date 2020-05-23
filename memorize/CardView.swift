import SwiftUI

struct CardView: View {
    
    var isFaceUp: Bool
    
    var body: some View {
        ZStack {
            if isFaceUp {
                RoundedRectangle(cornerRadius: 10).foregroundColor(.white)
                RoundedRectangle(cornerRadius: 10).stroke(lineWidth: 3)
                Text("🎸")
            } else {
                RoundedRectangle(cornerRadius: 10)
            }
        }
        .font(.largeTitle)
    }
}

struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        HStack {
            CardView(isFaceUp: true)
            CardView(isFaceUp: false)
        }
    }
}
