import SwiftUI

struct ConnectView: View {
    @State private var privateKey: String = ""
    
    var body: some View {
        NavigationView {
            VStack {
                HStack {
                    RoundedRectangle(cornerRadius: 5)
                        .frame(width: 80, height: 5)
                        .foregroundColor(.white.opacity(0.4))
                }
                .padding(.top, 10)
                
                
                Text("Connect your STX Wallet")
                    .bold()
                    .padding(.vertical, 10)
                
                TextField("Enter your private key", text: $privateKey)
                    .padding()
                    .background(Color.white.opacity(0.1))
                    .cornerRadius(10)
                    .foregroundColor(.white)
                    .keyboardType(.alphabet)
                    .autocapitalization(.none)
                    .padding(.top, 20)
                
                Button {
                    
                } label: {
                    Image(systemName: "doc.on.doc")
                        .padding(10)
                        .background(.gray.opacity(0.5))
                        .cornerRadius(10)
                }
                .offset(x: 154, y: -56)
                
                Spacer()
            }
            .padding(.horizontal, 16)
        }
    }
}

#Preview {
    ConnectView()
        .preferredColorScheme(.dark)
}
