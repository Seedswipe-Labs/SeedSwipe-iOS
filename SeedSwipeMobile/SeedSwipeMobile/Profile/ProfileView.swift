import SwiftUI

struct ProfileView: View {
    
    @State private var showWalletView: Bool = false
    
    var body: some View {
        NavigationView {
            ZStack {
                Image("SeedSwipe_bg")
                    .resizable()
                    .scaledToFill()
                    .ignoresSafeArea()
                
                VStack {
                    HStack(spacing: 16) {
                        Image("nkoorty")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 80, height: 80)
                            .clipShape(Circle())
                        
                        VStack(alignment: .leading, spacing: 8) {
                            HStack(spacing: 12) {
                                Text("Artemiy")
                                    .font(.system(size: 18, weight: .bold))
                                
                                Text("Investor")
                                    .font(.system(size: 17, weight: .semibold))
                                    .padding(.vertical, 6)
                                    .padding(.horizontal, 8)
                                    .background(
                                        RoundedRectangle(cornerRadius: 12)
                                            .fill(.black.opacity(0.5))
                                    )
                            }
                            
                            Text("Swiping since: 21.10.2023")
                                .font(.caption)
                        }
                        
                        Spacer()
                    }
                    
                    HStack {
                        Text("Preferences")
                            .font(.title3).bold()
                        
                        Spacer()
                    }
                    .padding(.top, 24)
                    
                    VStack(spacing: 6) {
                        HStack {
                            Image(systemName: "pin.fill")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 14, height: 14)
                            
                            Text("Health, Technology, Finance")
                            
                            Spacer()
                        }
                        
                        HStack {
                            Image(systemName: "dollarsign")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 16, height: 16)
                            
                            Text("1-2k")
                            
                            Spacer()
                        }
                        
                        HStack {
                            Image(systemName: "clock")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 16, height: 16)
                            
                            Text("Invested in 3 start-ups/companies")
                            
                            Spacer()
                        }
                    }
                    
                    HStack {
                        Text("Your Likes")
                            .font(.title3).bold()
                        
                        Spacer()
                    }
                    .padding(.top, 18)
                    
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack(spacing: 16) {
                            ForEach(likes) { like in
                                LikedView(like: like)
                            }
                        }
                        .padding(.horizontal, 16)
                    }
                    
                    Spacer()
                }
                .padding(.top, 134)
                .padding(.horizontal, 16)
            }
            .navigationTitle("Profile")
            .sheet(isPresented: $showWalletView) {
                ConnectView()
                    .presentationDetents([.fraction(0.3)])
            }
            .toolbar {
                ToolbarItemGroup(placement: .topBarTrailing) {
                    NavigationLink {
                        SettingsView()
                    } label: {
                        Image(systemName: "gearshape")
                    }
                }
            }
        }
    }
}

#Preview {
    ProfileView()
        .preferredColorScheme(.dark)
}

struct LikedView: View {
    
    var like: LikedCompany
    
    var body: some View {
        VStack {
            Image(like.imageUrl)
                .resizable()
                .scaledToFill()
                .frame(width: 70, height: 70)
                .cornerRadius(50)
            
            VStack {
                Text(like.name)
                    .bold()
                
                Text(like.date)
                    .font(.caption)
            }
        }
    }
}

struct LikedCompany: Identifiable, Hashable {
    var id = UUID()
    var name: String
    var imageUrl: String
    var date: String
}

var likes: [LikedCompany] = [
    LikedCompany(name: "ForcePrime", imageUrl: "forceprime", date: "4.11.2023"),
    LikedCompany(name: "Bitbasel", imageUrl: "bitbasel", date: "4.11.2023"),
    LikedCompany(name: "Bitflow", imageUrl: "bitflow", date: "3.11.2023")
]
