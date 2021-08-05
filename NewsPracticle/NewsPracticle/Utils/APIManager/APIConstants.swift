//
//  APIConstants.swift
//  NewsPracticle
//
//  Created by Dhaval Trivedi on 05/08/21.
//

import Foundation


//API COnstan file to store local or static objects.
struct APPURL {

    private struct Domains {
        static let Dev = "https://newsapi.org/v2/top-headlines?sources=google-news"
    }

    private  struct Routes {
        static let apiKey = "&apiKey="
        static let Api_Key = "7ef6c6ad69394f70947a9f4a83b37864"
    }

    private  static let Domain = Domains.Dev
    private  static let Route = Routes.apiKey + Routes.Api_Key
    static var BaseURL: String {
        return Domain + Route
    }
}
