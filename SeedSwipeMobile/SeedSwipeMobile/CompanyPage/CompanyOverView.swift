import SwiftUI

struct CompanyOverView: View {
    
    @State private var isInvestingView: Bool = false
    @State var selectedSegment = 0
    @State private var showTransactionView: Bool = false

    var body: some View {
        VStack {
            HStack(spacing: 14) {
                Image("terra")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 74, height: 74)
                    .cornerRadius(50)
                
                VStack(alignment: .leading, spacing: 2) {
                    Text("Terra API")
                        .font(.system(size: 20, weight: .bold))
                    
                    HStack {
                        Image(systemName: "map")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 14, height: 14)
                        
                        Text("London, UK")
                    }
                }
                
                Spacer()
            
                Button {
                    
                } label: {
                    Image(systemName: "square.and.arrow.up")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 24, height: 24)
                }
            }
            
            Divider()
                .padding(.vertical, 8)
            
            VStack(alignment: .leading) {
                Text("Terra is an API that makes it easy for apps to connect to wearables")
                    .font(.system(size: 16))
            }
            .frame(height: 50)
            
            Picker("", selection: $selectedSegment) {
                Text("Invest").tag(0)
                Text("Crowdfund").tag(1)
            }
            .pickerStyle(SegmentedPickerStyle())
            
            if selectedSegment == 0 {
                HStack {
                    Button {
                        isInvestingView.toggle()
                    } label: {
                        HStack {
                            Image("logo_rounded")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 30, height: 30)
                                .cornerRadius(6)
                            
                            Text("Invest with SeedSwipe")
                                .bold()
                        }
                        .padding(.vertical, 10)
                        .padding(.horizontal, 18)
                        .background(.white.opacity(0.2))
                        .cornerRadius(18)
                    }
                }
                .padding(.top, 8)
                .padding(.bottom, 8)
                
                VStack(alignment: .leading) {
                    Text("By investing you agree to the legal terms of the SeedSwipe investing agreement")
                        .font(.system(size: 16))
                }
                .frame(height: 50)
            } else if selectedSegment == 1 {
                HStack {
                    Button {
                        isInvestingView.toggle()
                    } label: {
                        HStack {
                            Image("logo_rounded")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 30, height: 30)
                                .cornerRadius(6)
                            
                            Text("Crowdfund with SeedSwipe")
                                .bold()
                        }
                        .padding(.vertical, 10)
                        .padding(.horizontal, 18)
                        .background(.white.opacity(0.2))
                        .cornerRadius(18)
                    }
                }
                .padding(.top, 8)
                .padding(.bottom, 8)
                
                VStack(alignment: .leading) {
                    Text("The crowdfunding is estimated to end on 31.10.2023 based on the block number")
                        .font(.system(size: 16))
                }
                .frame(height: 50)
            }
            
            Spacer()
        }
        .frame(width: UIScreen.screenWidth * 0.8, height: UIScreen.screenHeight * 0.38)
        .padding(20)
        .background(.ultraThinMaterial, in: RoundedRectangle(cornerRadius: 24,style: .continuous))
        .overlay{
            RoundedRectangle(cornerRadius: 24, style: .continuous).stroke(.white.opacity(0.2))
        }
        .shadow(radius: 1)
        .clipped()
        .padding(.top, 10)
        .sheet(isPresented: $isInvestingView, onDismiss: {
            self.showTransactionView = true
        }) {
            InvestView(isCrowdfunding: .constant(self.selectedSegment == 1))
                .presentationDetents([.fraction(0.3)])
        }
        
        VStack {
            HStack {
                Text("Transactions")
                    .font(.title2).bold()
                                
                Spacer()
            }
            .padding(.top, 18)
            
            if showTransactionView {
                TransactionView()
            }

        }
        .padding(.horizontal, 16)
        
        Spacer()
    }
}

#Preview {
    CompanyOverView()
        .preferredColorScheme(.dark)
}

struct TransactionView: View {
    
    var body: some View {
        VStack {
            HStack {
                HStack {
                    Text("0.5")
                        .font(.system(size: 24, weight: .bold))
                    
                    Text("SSW")
                        .font(.system(size: 20, weight: .regular))
                }
                
                Spacer()
                
                Text("4.11.2023")
                    .font(.caption)
            }
            
            HStack(spacing: 10) {
                Text("Confirming the transaction")
                
                ProgressView()
                
                Spacer()
                
                Image(systemName: "square.and.arrow.up")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 20, height: 20)
            }
            .padding(.top, 10)
            
            Spacer()
        }
        .padding()
        .frame(width: 364, height: 120)
        .background(.white.opacity(0.1))
        .cornerRadius(24)
        .overlay{
            RoundedRectangle(cornerRadius: 24, style: .continuous).stroke(.white.opacity(0.2))
        }
    }
}
