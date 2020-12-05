//
//  ArticlesModel.swift
//  NY-Times
//
//  Created by Abdelrhman Eliwa on 04/12/2020.
//

import Foundation

// MARK: - Articles
struct Articles: Codable {
    let status, copyright: String
    let numResults: Int
    let results: [Result]

    enum CodingKeys: String, CodingKey {
        case status, copyright
        case numResults = "num_results"
        case results
    }
}

// MARK: - Result
struct Result: Codable {
    let uri: String
    let url: String
    let id: Int?
    let assetID: Int?
    let source: String?
    let publishedDate: String?
    let updated: String?
    let section: String?
    let subsection: String?
    let nytdsection: String?
    let adxKeywords: String?
    let column: JSONNull?
    let byline: String?
    let type: String?
    let title: String?
    let abstract: String?
    let desFacet: [String]?
    let orgFacet: [String]?
    let perFacet: [String]?
    let geoFacet: [String]?
    let media: [Media]?
    let etaID: Int?

    enum CodingKeys: String, CodingKey {
        case uri
        case url
        case id
        case assetID = "asset_id"
        case source
        case publishedDate = "published_date"
        case updated
        case section
        case subsection
        case nytdsection
        case adxKeywords = "adx_keywords"
        case column
        case byline
        case type
        case title
        case abstract
        case desFacet = "des_facet"
        case orgFacet = "org_facet"
        case perFacet = "per_facet"
        case geoFacet = "geo_facet"
        case media
        case etaID = "eta_id"
    }
}

// MARK: - Media
struct Media: Codable {
    let type: String?
    let subtype: String?
    let caption: String?
    let copyright: String?
    let approvedForSyndication: Int?
    let mediaMetadata: [MediaMetadatum]?

    enum CodingKeys: String, CodingKey {
        case type
        case subtype
        case caption
        case copyright
        case approvedForSyndication = "approved_for_syndication"
        case mediaMetadata = "media-metadata"
    }
}

// MARK: - MediaMetadatum
struct MediaMetadatum: Codable {
    let url: String
    let format: String?
    let height, width: Int?
}

//enum Format: String, Codable {
//    case mediumThreeByTwo210 = "mediumThreeByTwo210"
//    case mediumThreeByTwo440 = "mediumThreeByTwo440"
//    case standardThumbnail = "Standard Thumbnail"
//}
//
//enum Subtype: String, Codable {
//    case photo = "photo"
//}
//
//enum MediaType: String, Codable {
//    case image = "image"
//}
//
//enum Source: String, Codable {
//    case newYorkTimes = "New York Times"
//}
//
//enum ResultType: String, Codable {
//    case article = "Article"
//}

//// MARK: - Encode/decode helpers
//
//class JSONNull: Codable, Hashable {
//
//    public static func == (lhs: JSONNull, rhs: JSONNull) -> Bool {
//        return true
//    }
//
//    public var hashValue: Int {
//        return 0
//    }
//
//    public init() {}
//
//    public required init(from decoder: Decoder) throws {
//        let container = try decoder.singleValueContainer()
//        if !container.decodeNil() {
//            throw DecodingError.typeMismatch(JSONNull.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Wrong type for JSONNull"))
//        }
//    }
//
//    public func encode(to encoder: Encoder) throws {
//        var container = encoder.singleValueContainer()
//        try container.encodeNil()
//    }
//}

struct JSONNull: Codable {}
