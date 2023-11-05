import Foundation

struct MessagePreview: Identifiable, Equatable {
    
    let id: UUID = UUID()
    let name: String
    let imageUrl: String
    let fromYou: Bool
    let lastMessage: String
    let time: String
    
}

extension MessagePreview {
    static let first = MessagePreview(name: "ForcePrime", imageUrl: "forceprime", fromYou: false, lastMessage: "", time: "2:04")
    static let second = MessagePreview(name: "Bitflow", imageUrl: "bitflow", fromYou: false, lastMessage: "That's great to hear!", time: "19:56")
    static let third = MessagePreview(name: "Bitbasel", imageUrl: "bitbasel", fromYou: true, lastMessage: "What kind of amount are you looking for?", time: "14:23")
    
    static let all: [MessagePreview] = [.first, .second, .third]
    static let almost_all: [MessagePreview] = [.second, .third]
}
