//
//  NewsSource.swift
//  Model Generated using http://www.jsoncafe.com/ 
//  Created on August 5, 2021

import Foundation

struct NewsSource : Codable {
    
    let id : String?
    let name : String?
    
    enum CodingKeys: String, CodingKey {
        case id = "id"
        case name = "name"
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        id = try values.decodeIfPresent(String.self, forKey: .id)
        name = try values.decodeIfPresent(String.self, forKey: .name)
    }
}
