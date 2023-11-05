import Foundation

struct Message: Identifiable, Equatable {
    enum Role {
        case user
        case receiver
    }
    
    let id: UUID = UUID()
    let content: String
    let createAt: Date = Date()
    let role: Role
}
