//
//  NewsViewController.swift
//  HobbyHiveRev
//
//  Created by Raihan Daffa Rizky on 12/12/23.
//

import UIKit

class NewsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var newsTableView: UITableView!
    
    var news: [News]? = []

    override func viewDidLoad() {
        super.viewDidLoad()
        newsTableView.delegate = self
        newsTableView.dataSource = self

        fetchNews()
    }
    
    func fetchNews(){
            let urlRequest = URLRequest(url: URL(string: "https://newsapi.org/v2/top-headlines?country=us&category=sports&apiKey=b71cd3aa60ac4a11a1f803a36a6ed30e")!)
            
            let task = URLSession.shared.dataTask(with: urlRequest) {(data, response, error) in
                
                if error != nil{
                    print(error as Any)
                    return
                }
                
                self.news = [News]()
                do {
                    let json = try JSONSerialization.jsonObject(with: data!, options: .mutableContainers) as! [String: AnyObject]
                    
                    if let articleFromJSON = json["articles"] as? [[String: AnyObject]]{
                        for articleJSON in articleFromJSON {
                            if let title = articleJSON["title"] as? String,
                                let author = articleJSON["author"] as? String,
                                let desc = articleJSON["description"] as? String,
                                let url = articleJSON["url"] as? String,
                                let urlImage = articleJSON["urlToImage"] as? String,
                                let cont = articleJSON["content"] as? String{
                                
                                let news = News()
                                news.title = title
                                news.author = author
                                news.desc = desc
                                news.url = url
                                news.imgUrl = urlImage
                                news.content = cont
                                
                                self.news?.append(news)
                            }
                        }
                        
                        DispatchQueue.main.async {
                             self.newsTableView.reloadData()
                        }
                    }
                    
                } catch let error {
                print(error)
                }
            }
            
            task.resume()
        }
        
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return min(10, self.news?.count ?? 0)
        }

        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let cell = tableView.dequeueReusableCell(withIdentifier: "newsCell", for: indexPath) as! NewsCell
            
            if let news = self.news, indexPath.item < news.count {
                let currentNews = news[indexPath.item]
                
                cell.newsTitleLabel.text = currentNews.title ?? ""
                cell.newsDescriptionLabel.text = currentNews.desc ?? ""
                cell.newsAuthorLabel.text = currentNews.author ?? ""
                
                if let imgUrl = currentNews.imgUrl {
                    cell.newsImageView.downloadImage(from: imgUrl)
                    cell.newsImageView.isHidden = false
                } else {
                    cell.newsImageView.isHidden = true
                }
            }
            
            return cell
        }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        let story = UIStoryboard(name: "Main", bundle: Bundle.main)
        
        let toNewsDetails = story.instantiateViewController(withIdentifier: "newsDetails") as! NewsDetailsViewController
        
        toNewsDetails.accomodateTitle = self.news?[indexPath.item].title
        toNewsDetails.accomodateCont = self.news?[indexPath.item].content
        toNewsDetails.accomodateAuthor = self.news?[indexPath.item].content
        toNewsDetails.accomodateImage = self.news?[indexPath.item].imgUrl
        
        show(toNewsDetails, sender: self)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 180
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
}

extension UIImageView{
    func downloadImage(from url: String){
        let urlRequest = URLRequest(url: URL(string: url)!)
        let task = URLSession.shared.dataTask(with: urlRequest) {(data, response, error) in
            
            if error != nil{
                print(error as Any)
                return
            }
            
            DispatchQueue.main.async {
                self.image = UIImage(data: data!)
            }
        }
        task.resume()
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
