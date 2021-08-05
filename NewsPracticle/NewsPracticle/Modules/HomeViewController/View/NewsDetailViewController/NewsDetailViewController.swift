//
//  NewsDetailViewController.swift
//  NewsPracticle
//
//  Created by Dhaval Trivedi on 05/08/21.
//

import UIKit

class NewsDetailViewController: UIViewController {
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var imgImageThumb: UIImageView!
    @IBOutlet weak var lblDescriptions: UILabel!
    @IBOutlet weak var lblAuthor: UILabel!
    @IBOutlet weak var lblPublishdDate: UILabel!
    @IBOutlet weak var scrollView: UIScrollView!
    
    var newsDetails: NewsArticle?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setNewsData()
        self.setupUI()
        
    }
    private func setupUI() {
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(imageTappedMethod(_:)))
        
        imgImageThumb.isUserInteractionEnabled = true
        imgImageThumb.addGestureRecognizer(tapGestureRecognizer)
    }
    
    @objc func imageTappedMethod(_ sender:AnyObject){
        self.navigateToNewsDetailViewController()
    }
    
    private func setNewsData() {
        if let data = newsDetails {
            self.title = Constants.NavigationBarTitleNames.NewsDetais
            lblTitle.text = data.title
            lblAuthor.text = data.author
            lblDescriptions.text = data.descriptionField
            lblPublishdDate.text = CommonFunctions.Instance.stringToDate(stringDate: data.publishedAt)
            if let strURL = data.urlToImage {
                imgImageThumb.setImage(url: strURL)
            }
        }
    }
    
    
    private func navigateToNewsDetailViewController() {
        guard let viewController = UIStoryboard(name: Constants.StoryBoardNames.Main, bundle: nil).instantiateViewController(withIdentifier: Constants.ViewControllerNames.ImageViewController) as? ImageViewController, let nav = self.navigationController else {
            return
        }
        if let data = newsDetails {
            viewController.imgURl = data.urlToImage
        }
        nav.pushViewController(viewController, animated: true)
    }
}
