//
//  PlaceDetailsViewController.swift
//  HobbyHiveRev
//
//  Created by Raihan Daffa Rizky on 12/12/23.
//

import UIKit

class PlaceDetailsViewController: UIViewController {
    
    
    
    @IBOutlet weak var placeTitleLabel: UILabel!
    @IBOutlet weak var placeAuthorLabel: UILabel!
    
    
    @IBOutlet weak var placeImageView: UIImageView!
    
    
    @IBOutlet weak var placeTextView: UITextView!
    
    
    @IBOutlet weak var bookingOnClick: UIButton!
    
    var selectedPlace: Place?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        updateUI()
    }
    
    func updateUI() {
          guard let place = selectedPlace else {
              return
          }

        placeTitleLabel.text = place.title
        placeAuthorLabel.text = place.author
        placeTextView.text = place.desc

          if let imgUrl = place.imgUrl {
              placeImageView.image = UIImage(named: imgUrl)
          } else {
              placeImageView.image = UIImage(named: "defaultImage")
          }
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
