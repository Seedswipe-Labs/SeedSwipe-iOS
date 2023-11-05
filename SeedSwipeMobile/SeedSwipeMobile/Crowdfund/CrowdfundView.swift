import SwiftUI

struct CrowdfundView: View {
    
    @State private var searchText: String = ""
    
    let columns = [
        GridItem(.adaptive(minimum: 160))
    ]
    
    var body: some View {
        NavigationView {
            ZStack {
                Image("SeedSwipe_bg")
                    .resizable()
                    .scaledToFill()
                    .ignoresSafeArea()
                
                VStack {
                        SearchBar(text: $searchText)
                            .padding(.bottom, 18)
                    ScrollView {
                        
                        LazyVGrid(columns: columns, spacing: 8) {
                            ForEach(categories) { category in
                                    CategoryView(category: category)
                            }
                        }
                        .padding(.bottom, 30)
                        
                        HStack {
                            Text("Newly added")
                                .font(.system(size: 18, weight: .bold))
                            
                            Spacer()
                            
                            Button {
                                
                            } label: {
                                Image(systemName: "chevron.right")
                            }
                        }
                        
                        ScrollView(.horizontal, showsIndicators: false) {
                            HStack {
                                ForEach(Company.new) { company in
                                    NavigationLink {
                                        CompanyOverView()
                                    } label: {
                                        CrowdPreview(company: company)
                                    }
                                }
                            }
                        }
                        .padding(.bottom, 30)
                        
                        HStack {
                            Text("Hot right now")
                                .font(.system(size: 18, weight: .bold))
                            
                            Spacer()
                            
                            Button {
                                
                            } label: {
                                Image(systemName: "chevron.right")
                            }
                        }
                        
                        ScrollView(.horizontal, showsIndicators: false) {
                            HStack {
                                ForEach(Company.hot) { company in
                                    NavigationLink {
                                        CompanyOverView()
                                    } label: {
                                        CrowdPreview(company: company)
                                    }
                                }
                            }
                        }
                        
                        Spacer()
                    
                    }
                }
                .padding(.top, 100)
                .padding(.horizontal, 16)
            }
            .navigationTitle("Explore")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}


#Preview {
    CrowdPreview(company: Company.first)
        .preferredColorScheme(.light)
}

#Preview {
    CrowdfundView()
        .preferredColorScheme(.dark)
}

struct CrowdPreview: View {
    
    var company: Company
    
    var body: some View {
        VStack {
            Image(company.mediaUrl)
                .resizable()
                .scaledToFill()
                .frame(height: 80)
                .cornerRadius(14)
                .brightness(-0.4)
                .padding(10)
                .offset(y: 30)
            
            HStack {
                Image(company.imageUrl)
                    .resizable()
                    .scaledToFill()
                    .frame(width: 50, height: 50)
                    .cornerRadius(50)
                    .padding(.leading, 20)
                    .offset(y: -16)
                
                Spacer()
            }
            
            VStack(alignment: .leading, spacing: 2) {
                HStack {
                    Text(company.name)
                        .font(.system(size: 16, weight: .bold))
                    
                    Spacer()
                }
                
                HStack(spacing: 2) {
                    Image(systemName: "map")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 12, height: 12)
                    
                    Text(company.location)
                        .font(.system(size: 14))
                    
                    Spacer()
                }
            }
            .padding(.leading, 80)
            .offset(y: -40)
            
            Spacer()
        }
        .frame(width: 240, height: 150)
        .background(.white.opacity(0.1))
        .cornerRadius(16)
        .overlay{
            RoundedRectangle(cornerRadius: 16, style: .continuous).stroke(.white.opacity(0.2))
        }
        .clipped()
    }
}


struct CategoryType: Identifiable, Hashable {
    var id = UUID()
    var name: String
}

var categories: [CategoryType] = [
    CategoryType(name: "💰 Finance"),
    CategoryType(name: "🏥 Health"),
    CategoryType(name: "⚙️ Technology"),
    CategoryType(name: "🏠 Living"),
    CategoryType(name: "🔗 Crypto"),
    CategoryType(name: "📚 Education"),
]

struct CategoryView: View {
    
    var category: CategoryType
    
    var body: some View {
        HStack {
            Text(category.name)
                .foregroundStyle(.white)
                .font(.system(size: 16, weight: .bold))
                .offset(x: 12)
            
            Spacer()
        }
        .frame(width: 174, height: 50)
        .background(.black.opacity(0.4))
        .cornerRadius(8)
        .overlay{
            RoundedRectangle(cornerRadius: 8, style: .continuous).stroke(.white.opacity(0.2))
        }
    }
}

struct SearchBar: View {
    @Binding var text: String
    @State private var isEditing = false

    var body: some View {
        HStack {
            TextField("Search...", text: $text)
                .padding(7)
                .padding(.horizontal, 25)
                .background(Color(.white.opacity(0.2)))
                .cornerRadius(8)
                .overlay(
                    HStack {
                        Image(systemName: "magnifyingglass")
                            .foregroundColor(.gray)
                            .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                            .padding(.leading, 8)

                        if isEditing {
                            Button(action: {
                                self.text = ""
                            }) {
                                Image(systemName: "multiply.circle.fill")
                                    .foregroundColor(.gray)
                                    .padding(.trailing, 8)
                            }
                        }
                    }
                )
                .padding(.horizontal, 0)
                .onTapGesture {
                    self.isEditing = true
                }

            if isEditing {
                Button(action: {
                    self.isEditing = false
                    self.text = ""
                    UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
                }) {
                    Text("Cancel")
                }
                .padding(.trailing, 10)
                .transition(.move(edge: .trailing))
                .animation(.default)
            }
        }
    }
}
