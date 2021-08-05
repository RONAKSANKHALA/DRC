//
//  ImageViewController.swift
//  NewsPracticle
//
//  Created by Dhaval Trivedi on 05/08/21.
//

import UIKit

class ImageViewController: UIViewController {
    var imgURl: String?
    @IBOutlet weak var imgNews: UIImageView!
    @IBOutlet weak var scrollView: UIScrollView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        scrollView.minimumZoomScale = 1.0
        scrollView.maximumZoomScale = 6.0
        if let strURL = imgURl {
            imgNews.setImage(url: strURL)
        }
    }
}

extension ImageViewController: UIScrollViewDelegate {
    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        return imgNews
    }
}
