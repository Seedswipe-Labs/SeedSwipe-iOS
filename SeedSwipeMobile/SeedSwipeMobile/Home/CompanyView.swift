import SwiftUI

struct CompanyView: View {
    
    let columns = [
        GridItem(.adaptive(minimum: 100))
    ]
    
    var company: Company
    
    var body: some View {
        VStack(alignment: .leading) {
            Image(company.mediaUrl)
                .resizable()
                .scaledToFill()
                .frame(width: 340, height: 196)
                .cornerRadius(30)
                .padding(.top, 0)
                .offset(y: 10)
                .hCenter()
             
            HStack(spacing: 10) {
                Image(company.imageUrl)
                    .resizable()
                    .scaledToFill()
                    .frame(width: 64, height: 64)
                    .cornerRadius(50)
                    .padding(.leading, 16)
                    .offset(y: -30)
                
                Spacer()
            }
            
            HStack {
                VStack(alignment: .leading, spacing: 4) {
                    Text(company.name)
                        .font(.system(size: 20, weight: .bold))
                        .offset(y: -8)
                    
                    HStack {
                        Image(systemName: "map")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 14, height: 14)
                        
                        Text(company.location)
                            .font(.system(size: 15))
                    }
                }
                
                Spacer()
                
                Button {
                    
                } label: {
                    Image(systemName: "square.and.arrow.up")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 25, height: 25)
                    
                }
            }
            .offset(y: -20)
            .padding(.leading, 16)
            
            Divider()
                .padding(.bottom, 8)
                .padding(.leading, 16)
                .offset(y: -18)
            
            VStack(alignment: .leading) {
                Text("Terra is an API that makes it easy for apps to connect to wearables")
                    .font(.system(size: 16))
            }
            .offset(y: -14)
            .padding(.leading, 16)
            .frame(height: 50)
            
            
            Divider()
                .padding(.bottom, 8)
                .padding(.leading, 16)
                .offset(y: -10)
            
            Text("Overview")
                .font(.system(size: 17, weight: .bold))
                .padding(.horizontal, 16)
                .offset(y: -12)
                      
            VStack(alignment: .leading, spacing: 6) {
                HStack {
                    
                    VStack {
                        Image(systemName: "person.2.fill")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 18, height: 18)
                        
                        Text(company.size)
                    }
                    
                    Spacer()
                    
                    VStack {
                        Image(systemName: "dollarsign")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 18, height: 18)
                        
                        Text(company.funding)
                    }
                    
                    Spacer()
                    
                    VStack {
                        Image(systemName: "globe")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 18, height: 18)
                        
                        Button {
                            
                        } label: {
                            Text(company.websiteUrl)
                                .underline()
                        }
                    }
                }
                
            }
            .padding(.bottom, 16)
            .padding(.leading, 16)
            .offset(y: -10)
            
            Spacer()
        }
        .frame(width: UIScreen.screenWidth * 0.8, height: UIScreen.screenHeight * 0.56)
        .padding(24)
        .background(.ultraThinMaterial, in: RoundedRectangle(cornerRadius: 34,style: .continuous))
        .overlay{
            RoundedRectangle(cornerRadius: 34, style: .continuous).stroke(.white.opacity(0.2))
        }
        .shadow(radius: 1)
        .clipped()
    }
}

#Preview {
    CompanyView(company: Company.first)
        .preferredColorScheme(.dark)
}
