//
//  NewsViewModel.swift
//  NewsPracticle
//
//  Created by Dhaval Trivedi on 05/08/21.
//

import Foundation
import Alamofire
import RxSwift
import RxCocoa

class NewsViewModel {
    let items = PublishSubject<[NewsArticle]>()
    
    func fetchNewsFeedDetails() {
        if let url =  URL(string: APPURL.BaseURL) {
            var urlRequest = URLRequest(url: url, cachePolicy: .reloadIgnoringCacheData, timeoutInterval: 100)
            urlRequest.httpMethod = "GET"
            
            AF.request(urlRequest).responseJSON { response in
                if let data = response.data {
                    do {
                        let response = try JSONDecoder().decode(NewsRoot.self, from: data)
                        switch response.status {
                        case .ok:
                            guard let articles = response.articles else { return }
                            self.items.onNext(articles)
                            self.items.onCompleted()
                        default:
                            print("Somthing Went Wrong Please try Again!!!!")
                        }
                    } catch let error {
                        self.items.onError(error)
                    }
                }
            }
        }
    }
}
