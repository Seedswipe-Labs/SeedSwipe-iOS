import SwiftUI

struct InvestView: View {
    @Environment(\.presentationMode) var presentationMode
    @Environment(\.openURL) var openURL
    @State private var amount: String = ""
    @Binding var isCrowdfunding: Bool

    private var numberFormatter: NumberFormatter = {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        formatter.maximumFractionDigits = 7
        return formatter
    }()
    
    init(isCrowdfunding: Binding<Bool>) {
        self._isCrowdfunding = isCrowdfunding
    }

    var body: some View {
        VStack {
            Capsule()
                .fill(.white.opacity(0.4))
                .frame(width: 60, height: 4)
                .padding(.top, 14)
            
            HStack(spacing: 4) {
                Text(isCrowdfunding ? "Crowdfund with" : "Invest with")
                    .bold()
                
                Image("logo_rounded")
                    .resizable()
                    .scaledToFit()
                    .frame(height: 30)
                    .offset(y: 1)
            }
            .padding(.top, 10)
            .padding(.bottom, 40)
            
            HStack(alignment: .bottom) {
                Spacer()
                    .frame(width: 10)
                
                Text("SSW")
                    .font(.system(size: 26, weight: .bold, design: .rounded))
                    .offset(y: -15)
                
                Spacer()
                    .frame(width: 10)
                
                TextField("0.00001", text: $amount)
                    .keyboardType(.decimalPad)
                    .font(.system(size: 40, weight: .bold, design: .rounded))
                    .onChange(of: amount) { newValue in
                        let filtered = newValue.filter("0123456789.".contains)
                        if filtered != newValue {
                            amount = filtered
                        }

                        if let dotIndex = amount.firstIndex(of: "."), amount.distance(from: dotIndex, to: amount.endIndex) > 8 {
                            amount = String(amount.prefix(upTo: amount.index(dotIndex, offsetBy: 8)))
                        }
                    }
                    .frame(width: 200)
                    .offset(y: -10)
                
                Button {
                    presentationMode.wrappedValue.dismiss()
                } label: {
                    Image(systemName: "arrow.up.circle.fill")
                        .foregroundColor(.purple)
                        .font(Font.system(size: 34, weight: .regular))
                }
                .offset(x: -6, y: -15)
            }
            
            Spacer()
        }
    }
}

#Preview {
    PaymentView()
        .preferredColorScheme(.dark)
}
