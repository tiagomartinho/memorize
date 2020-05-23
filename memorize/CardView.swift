import SwiftUI

struct CardView: View {
    
    var isFaceUp: Bool
    
    var body: some View {
        ZStack {
            if isFaceUp {
                RoundedRectangle(cornerRadius: 20).foregroundColor(.white)
                RoundedRectangle(cornerRadius: 20).stroke()
                Text("🎸")
            } else {
                RoundedRectangle(cornerRadius: 20)
            }
        }.foregroundColor(.orange)
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
