
import Foundation
import UIKit


struct GlobalSearchResults: Decodable {
    var results: [Results]?
}

struct Results: Decodable {
    var id: String?
    var itemType: String?
    var contentType: ContentType?
    var path: String?
    var itemDetails: SearchResultItemDetails?
    var quickActionData: QuickActionData?
    enum CodingKeys: String, CodingKey {
        case id
        case itemType = "ItemType"
        case contentType = "contenttype"
        case path = "Path"
        case itemDetails = "Data"
        case quickActionData
    }
}

struct SearchResultItemDetails: Decodable {
    var title: String?
    var description: String?
    var entity: SearchResultItemResponsibleEntity?
    var tammsso: String?
    var loginRequired: String?
    var serviceCardURL: String?
    let redirectToNativeServices: Bool?
    var serviceId: String?
    var serviceCode: String?

    enum CodingKeys: String, CodingKey {
        case title
        case description
        case entity = "ServiceResponsibleEntity"
        case tammsso
        case loginRequired = "loginrequired"
        case serviceCardURL = "OnlineService"
        case redirectToNativeServices = "IsNative"
        case serviceId = "serviceid"
        case serviceCode = "Code"
    }
}

struct SearchResultItemResponsibleEntity: Decodable {
    var name: String?
}

enum ContentType: String, Decodable {
    case generalInformation = "Information"
    case services = "Services"
    case tool = "Tool"
    case journeys = "Journeys"
    case other

    // MARK: - mapping the icon based on type
    func imageType() -> UIImage? {
        switch self {
        case ContentType.generalInformation:
            return UIImage(named: "Information_Icon")!
        case ContentType.services:
            return UIImage(named: "Services_Icon")!
        case ContentType.tool:
            return UIImage(named: "Tools_Icon")!
        case ContentType.journeys:
            return UIImage(named: "Journey_Icon")!
        default:
            return UIImage()
        }
    }
    
    init(from decoder: Decoder) throws {
        let value = try decoder.singleValueContainer().decode(String.self)
        self = ContentType(rawValue: value) ?? .other
    }
}

struct QuickActionData: Decodable {
    let title: String
    let icon: String
}
