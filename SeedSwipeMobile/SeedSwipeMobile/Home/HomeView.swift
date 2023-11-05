import SwiftUI

struct HomeView: View {
    
    @ObservedObject var homeViewModel = HomeViewModel()
    @State private var showToast = false
    
    var body: some View {
        NavigationView {
            ZStack {
                Image("SeedSwipe_bg")
                    .resizable()
                    .ignoresSafeArea()
                
                if homeViewModel.isLoading {
                    ProgressView()
                        .scaleEffect(1.5, anchor: .center)
                        .progressViewStyle(CircularProgressViewStyle(tint: .white))
                } else {
                    DoneView {
                        homeViewModel.fetchCompanies()
                    }
                    
                    ZStack {
                        ForEach(homeViewModel.companies, id: \.id) { company in
                            CompanySwipeView(company: company) { likeType in
                                onLike(company, type: likeType)
                            }
                            .padding(10)
                        }
                    }
                    .offset(y: -30)
                    
                    HStack(spacing: 16) {
                        HStack {
                            Image(systemName: "arrow.left.square")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 16, height: 16)
                            
                            Text("Disliked")
                        }
                        
                        HStack {
                            Image(systemName: "arrow.up.square")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 16, height: 16)
                            
                            Text("Interested")
                        }
                        
                        HStack {
                            Image(systemName: "arrow.right.square")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 16, height: 16)
                            
                            Text("Liked")
                        }
                    }
                    .offset(y: 270)
                    .hCenter()
                }
                
            }
            .navigationTitle("SeedSwipe")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItemGroup(placement: .topBarTrailing) {
                    Button {
                        
                    } label: {
                        Image(systemName: "info.circle")
                    }
                }
            }
        }
    }
    
    func onLike(_ company: Company, type likeType: LikeType) {
        withAnimation {
            homeViewModel.removeCompany(company) 
        }

        switch likeType {
        case .like:
            print("You disliked \(company.name)")
        case .dislike:
            showToast.toggle()
            print("You liked \(company.name)")
        case .interested:
            print("You're interested \(company.name)")
        }
    }
}

private struct DoneView: View {
    
    let reload: () -> Void
    
    var body: some View {
        VStack {
            Text("You've filled in all the cards!")
                .padding(.bottom, 10)
            
            Button("Refresh") {
                reload()
            }
            .buttonStyle(.borderedProminent)
            .foregroundStyle(.blue)
        }
        .padding(.bottom, 20)
    }
}

class HomeViewModel: ObservableObject {
    
    @Published var companies: [Company] = []
    @Published var isLoading: Bool = false
    @Published var error: Error?
    private var allCompanies: [Company] = Company.all

    init() {
        fetchCompanies()
    }

    func fetchCompanies() {
        isLoading = true

        DispatchQueue.global().asyncAfter(deadline: .now()) {
            DispatchQueue.main.async {
                self.companies = self.allCompanies
                self.isLoading = false
            }
        }
    }

    // Function to remove a company
    func removeCompany(_ company: Company) {
        if let index = companies.firstIndex(of: company) {
            companies.remove(at: index)
        }
    }
}

#Preview {
    HomeView()
        .preferredColorScheme(.dark)
}
