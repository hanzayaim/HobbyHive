//
//  NewsDetailsViewController.swift
//  HobbyHiveRev
//
//  Created by Raihan Daffa Rizky on 12/12/23.
//

import UIKit

class NewsDetailsViewController: UIViewController {
    
    @IBOutlet weak var newsTitleLabel: UILabel!
    @IBOutlet weak var newsAuthorLabel: UILabel!
    
    @IBOutlet weak var newsImageView: UIImageView!
    
    @IBOutlet weak var newsTextView: UITextView!
    
    var accomodateCont: String?
    var accomodateTitle: String?
    var accomodateImage: String?
    var accomodateAuthor: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        if let imageUrlString = accomodateImage, let imageUrl = URL(string: imageUrlString) {
            let data = try? Data(contentsOf: imageUrl)
            newsImageView.image = UIImage(data: data ?? Data())
        } else {
            newsImageView.image = UIImage(named: "defaultImage")
        }
        
        newsTitleLabel.text = accomodateTitle
        newsAuthorLabel.text = accomodateAuthor
        newsTextView.text = accomodateCont
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
