import Foundation

class ChatViewModel: ObservableObject {
    
    @Published var hasAddedChat = false
    
    @Published var messages: [Message] = [

//        Message(content: "Hello!", role: .receiver),
//        Message(content: "Hi there! How can I help you today?", role: .user)
    ]
    
    @Published var currentInput: String = ""
    
    func sendMessage() {
        guard !currentInput.isEmpty else { return }
        
        // Add the user's message
        messages.append(Message(content: currentInput, role: .user))
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) { [weak self] in
            self?.messages.append(Message(content: "The Sorobanathon of course!", role: .receiver))
        }
        
        currentInput = ""
    }
}
