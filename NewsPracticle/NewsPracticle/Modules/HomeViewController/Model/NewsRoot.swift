//
//  NewsRoot.swift
//  Model Generated using http://www.jsoncafe.com/ 
//  Created on August 5, 2021

import Foundation

enum APIStatus: String, Codable {
    case ok
}

struct NewsRoot : Codable {
    
    let articles : [NewsArticle]?
    let status : APIStatus?
    let totalResults : Int?
    
    enum CodingKeys: String, CodingKey {
        case articles = "articles"
        case status = "status"
        case totalResults = "totalResults"
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        articles = try values.decodeIfPresent([NewsArticle].self, forKey: .articles)
        status = try values.decodeIfPresent(APIStatus.self, forKey: .status)
        totalResults = try values.decodeIfPresent(Int.self, forKey: .totalResults)
    }
}
