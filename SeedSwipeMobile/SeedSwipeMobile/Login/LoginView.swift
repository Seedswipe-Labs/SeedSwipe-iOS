import SwiftUI

struct LoginView: View {
    
    @State private var email: String = ""
    @State private var password: String = ""
    @State private var showWalletView: Bool = false
    
    var body: some View {
        NavigationView {
            ZStack {
                Image("SeedSwipe_bg")
                    .resizable()
                    .scaledToFill()
                    .ignoresSafeArea()
                
                VStack {
                    VStack(spacing: 12) {
                        Image("Logo")
                            .resizable()
                            .scaledToFit()
                            .frame(height: 140)
                            .cornerRadius(34)
                            .hCenter()
                        
                        Text("SeedSwipe")
                            .font(.title2).bold()
                    }
                    .padding(.vertical, 34)
                    .padding(.top, 2)
                    
                    
                    TextField("E-mail address", text: $email)
                        .padding()
                        .background {
                            RoundedRectangle(cornerRadius: 8)
                                .fill(
                                    Color.white.opacity(0.04)
                                )
                        }
                        .textInputAutocapitalization(.never)
                        .disableAutocorrection(true)
                    
                    SecureField("Password", text: $password)
                        .padding()
                        .background {
                            RoundedRectangle(cornerRadius: 8)
                                .fill(
                                    Color.white.opacity(0.04)
                                )
                        }
                        .textInputAutocapitalization(.never)
                        .padding(.top, 0)
                        .padding(.bottom, 20)
                    
                    Divider()
                        .padding(.vertical, 0)
                    
                    Button {
                        
                    } label: {
                        HStack {
                            Text("Don't have an account?")
                                .font(.caption)
                                .foregroundColor(.white.opacity(0.60))
                            
                            Text("Sign Up")                        
                                .font(.caption)
                                .foregroundColor(.blue)
                            
                        }
                    }
                    .hCenter()
                    .padding(.top, 20)
                    .padding(.leading, 4)
                    
                    Spacer()
                    
                    NavigationLink {
                        TabBarView()
                    } label: {
                        HStack(spacing: 12) {
                            Text("Login with SeedBase")
                                .font(.system(size: 18, weight: .bold))
                                .foregroundStyle(.white)
                        }
                        .hCenter()
                        .padding(.leading, 10)
                        .background(
                            RoundedRectangle(cornerRadius: 20)
                                .fill(.blue.opacity(0.8))
                                .frame(height: 50)
                        )
                        .padding(.top, 20)
                    }
                    
                    Text("By continuing, you agree to our User Agreement and Privacy Policy.")
                        .font(.caption)
                        .foregroundColor(.white.opacity(0.60))
                        .hCenter()
                        .padding(.top, 20)
                        .padding(.leading, 4)
                    
                    Spacer()
                }
                .padding(.top, 60)
                .padding(.horizontal, 16)
            }
            .sheet(isPresented: $showWalletView) {
                ConnectView()
                    .presentationDetents([.fraction(0.3)])
            }
        }
    }
}

#Preview {
    LoginView()
        .preferredColorScheme(.dark)
}
