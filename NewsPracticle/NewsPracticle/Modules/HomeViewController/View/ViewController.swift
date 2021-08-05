//
//  ViewController.swift
//  NewsPracticle
//
//  Created by Dhaval Trivedi on 05/08/21.
//

import UIKit
import RxSwift
import RxCocoa


class ViewController: UIViewController {
    
    @IBOutlet var tblNewsFeed: UITableView!
    private var bag = DisposeBag()
    private var newsViewModel = NewsViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tblNewsFeed.rx.setDelegate(self).disposed(by: bag)
        newsViewModel.fetchNewsFeedDetails()
        self.bindTableViewforNewsFeed()
    }
}
extension ViewController: UITableViewDelegate {
    
    private func bindTableViewforNewsFeed() {
        newsViewModel.items.bind(to: tblNewsFeed.rx.items(cellIdentifier: Constants.TableViewCellNames.NewsTableViewCell, cellType: NewsTableViewCell.self)) {(row, item, cell) in
            cell.newsArticles = item
            cell.buttonPressed = {
                guard let url = URL(string: item.url ?? "") else { return }
                UIApplication.shared.open(url)
            }
        }.disposed(by: bag)
        
        tblNewsFeed.rx.modelSelected(NewsArticle.self).subscribe(onNext: { item in
            self.navigateToNewsDetailViewController(selectedItems: item)
        }).disposed(by: bag)
    }
    
    private func navigateToNewsDetailViewController(selectedItems: NewsArticle) {
        guard let viewController = UIStoryboard(name: Constants.StoryBoardNames.Main, bundle: nil).instantiateViewController(withIdentifier: Constants.ViewControllerNames.NewsDetailViewController) as? NewsDetailViewController, let nav = self.navigationController else {
            return
        }
        viewController.newsDetails = selectedItems
        nav.pushViewController(viewController, animated: true)
    }
}

