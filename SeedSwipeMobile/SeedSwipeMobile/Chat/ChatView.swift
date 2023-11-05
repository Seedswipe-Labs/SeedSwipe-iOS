import SwiftUI

struct ChatView: View {
    var body: some View {
        NavigationView {
            ZStack {
                Image("SeedSwipe_bg")
                    .resizable()
                    .scaledToFill()
                    .ignoresSafeArea()
                
                VStack {
                    ScrollView {
                        ForEach(MessagePreview.all) { chat in
                            NavigationLink {
                                ConversationView()
                                    .environmentObject(ChatViewModel())
                            } label: {
                                ChatRowPreview(messagePreview: chat)
                                    .padding(.vertical, 4)
                            }
                            
                            HStack {
                                Spacer()
                                
                                RoundedRectangle(cornerRadius: 2)
                                    .fill(.white.opacity(0.1))
                                    .frame(width: UIScreen.screenWidth*0.77, height: 2)
                            }
                        }
                        
                        Spacer()
                    }
                }
                .padding(.top, 134)
                .padding(.horizontal, 16)
                    
            }
    
            .navigationTitle("Chats")
        }
    }
}

#Preview {
    ChatView()
        .preferredColorScheme(.dark)
}
