//
//  PlaceViewController.swift
//  HobbyHiveRev
//
//  Created by Raihan Daffa Rizky on 12/12/23.
//

import UIKit

class PlaceViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var placeTableView: UITableView!
    
    var place: [Place] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setPlace()
        setupTableView()
    }
    
    func setPlace() {
        let place1 = Place()
        place1.imgUrl = "place1"
        place1.title = "Muselo Sports & Cafe"
        place1.author = "Andi"
        place1.desc = "Muselo Badminton Hall memiliki 2 lapangan Badminton dengan beralaskan karpet Li-Ning Original."
        place1.content = "Muselo Badminton Hall memiliki 2 lapangan Badminton dengan beralaskan karpet Li-Ning Original. Tersedia tempat duduk tribun untuk penonton juga pemain, fasilitas WC (2 Closet Seat, 2 Closet Jongkok) dan Mushola juga tersedia. Area parkir yang luas untuk motor dan mobil."
        
        let place2 = Place()
        place2.imgUrl = "place2"
        place2.title = "Pandawa Badminton Arena"
        place2.author = "Bima"
        place2.desc = "5 Badminton Court with BWF-International Standard carpet and lighting, with Cafe for hangout."
        place2.content = "5 Badminton Court with BWF-International Standard carpet and lighting, with Cafe for hangout."
        
        let place3 = Place()
        place3.imgUrl = "place3"
        place3.title = "Estadio Arena"
        place3.author = "Roni"
        place3.desc = "Lapangan Mini Soccer rumput sintetis ukuran 60 X 40 M"
        place3.content = "Lapangan Mini Soccer rumput sintetis ukuran 60 X 40 M"
        
        let place4 = Place()
        place4.imgUrl = "place4"
        place4.title = "Estadio Jakarta"
        place4.author = "Abi"
        place4.desc = "Lapangan Basket 3X3 Ukuran standar FIBA"
        place4.content = "Lapangan Basket 3X3 Ukuran standar FIBA"
        
        let place5 = Place()
        place5.imgUrl = "place5"
        place5.title = "Happy Hoops"
        place5.author = "Frimawan"
        place5.desc = "Lapangan terbaik yang ada di Jakarta"
        place5.content = "Lapangan terbaik yang ada di Jakarta"
        
        let place6 = Place()
        place6.imgUrl = "place1"
        place6.title = "Muselo Sports & Cafe"
        place6.author = "Andi"
        place6.desc = "Muselo Badminton Hall memiliki 2 lapangan Badminton dengan beralaskan karpet Li-Ning Original."
        place6.content = "Muselo Badminton Hall memiliki 2 lapangan Badminton dengan beralaskan karpet Li-Ning Original. Tersedia tempat duduk tribun untuk penonton juga pemain, fasilitas WC (2 Closet Seat, 2 Closet Jongkok) dan Mushola juga tersedia. Area parkir yang luas untuk motor dan mobil."
        
        place.append(place1)
        place.append(place2)
        place.append(place3)
        place.append(place4)
        place.append(place5)
        place.append(place6)
    }
    
    func setupTableView() {
           placeTableView.delegate = self
            placeTableView.dataSource = self
            placeTableView.reloadData()
       }
       
       func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
           return place.count
       }
       
       func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
           let cell = tableView.dequeueReusableCell(withIdentifier: "placeCell", for: indexPath) as! PlaceCell
           
           let currentPlace = place[indexPath.row]
           
           cell.placeTitleLabel.text = currentPlace.title
           cell.placeDescriptionLabel.text = currentPlace.desc
           cell.placeAuthorLabel.text = currentPlace.author
           
           if let imgUrl = currentPlace.imgUrl {
               cell.placeImageView.image = UIImage(named: imgUrl)
           } else {
               cell.placeImageView.image = UIImage(named: "defaultPlaceImage")
           }
           
           return cell
       }
       
       func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
           let story = UIStoryboard(name: "Main", bundle: Bundle.main)
           let toPlaceDetails = story.instantiateViewController(withIdentifier: "placeDetails") as! PlaceDetailsViewController

           toPlaceDetails.selectedPlace = place[indexPath.row]

           show(toPlaceDetails, sender: self)
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
