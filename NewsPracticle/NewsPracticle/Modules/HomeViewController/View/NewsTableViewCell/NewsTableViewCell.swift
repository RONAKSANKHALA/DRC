//
//  NewsTableViewCell.swift
//  NewsPracticle
//
//  Created by Dhaval Trivedi on 05/08/21.
//

import UIKit

class NewsTableViewCell: UITableViewCell {

    var buttonPressed : (() -> ()) = {}

    @IBOutlet weak var lblNewstitle: UILabel!
    @IBOutlet weak var lblNewsAuthorName: UILabel!
    @IBOutlet weak var lblPublisheDate: UILabel!
    @IBOutlet weak var imgNewsThumb: UIImageView!
    @IBOutlet weak var webViewButton: UIButton!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    var newsArticles: NewsArticle? {
        didSet {
            if let data = newsArticles {
                if let strURL = data.urlToImage {
                    imgNewsThumb.setImage(url: strURL)
                }
                self.lblNewstitle.text = data.title
                self.lblNewsAuthorName.text = data.author
                self.lblPublisheDate.text = CommonFunctions.Instance.stringToDate(stringDate: data.publishedAt)
            }
        }
    }
    @IBAction func onWebViewButtonClicked(_ sender: Any) {
        self.buttonPressed()
    }
}
