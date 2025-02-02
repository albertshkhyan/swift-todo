import SwiftUI

struct LaunchScreenView: View {
    var body: some View {
        VStack {
            Image("LaunchLogo") // Add your logo in Assets
                .resizable()
                .scaledToFit()
                .frame(width: 150, height: 150)
            
            Text("TodoSwift")
                .font(.largeTitle)
                .fontWeight(.bold)
                .foregroundColor(.blue)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.white) // Optional: Set background color
    }
}

#Preview {
    LaunchScreenView()
}
