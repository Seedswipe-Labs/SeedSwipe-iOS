import Foundation

struct Company: Identifiable, Equatable {
    
    let id =  UUID()
    let name: String
    let imageUrl: String
    let location: String
    let size: String
    let funding: String
    let websiteUrl: String
    let mediaUrl: String
    
}

extension Company {
    static let first = Company(name: "Terra API", imageUrl: "terra", location: "London, UK", size: "11-50", funding: "Seed ($2M+)", websiteUrl: "tryterra.co", mediaUrl: "terra_preview")
    static let second = Company(name: "EasyA", imageUrl: "easya", location: "London, UK", size: "1-10", funding: "Seed", websiteUrl: "easya.io", mediaUrl: "easya_banner")
    static let third = Company(name: "Liquidium", imageUrl: "liquidium", location: "Web3", size: "11-50", funding: "Series A", websiteUrl: "liquidium.fi", mediaUrl: "liquidium_banner")
    
    static let all: [Company] = [.first, .fifth, .third]
    
    static let fourth = Company(name: "Bitflow", imageUrl: "bitflow", location: "Web3", size: "11-50", funding: "Series B", websiteUrl: "bitflow.finance", mediaUrl: "bitflow_banner")
    
    static let fifth = Company(name: "Bitbasel", imageUrl: "bitbasel", location: "Web3", size: "51-100", funding: "Series A", websiteUrl: "bitbasel.com", mediaUrl: "bitbasel_banner")
    
    static let messages: [Company] = [.second, .fourth, .fifth]
    
    static let new: [Company] = [.fourth, .fifth, .first]
    
    static let hot: [Company] = [.first, .third, .fourth]
}


enum LikeType {
    
    case like
    case dislike
    case interested

}
