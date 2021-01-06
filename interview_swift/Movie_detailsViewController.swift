//
//  Movie_detailsViewController.swift
//  interview_swift
//
//  Created by awad Ibrahim on 05/01/2021.
//

import UIKit

class Movie_detailsViewController: UIViewController {

    var title_value = ""
    var date_value = ""
    var vote_value = ""
    var describtion_value = ""
    var  image_value = ""
    
    @IBOutlet weak var title_label: UILabel!
    @IBOutlet weak var date_label: UILabel!
    @IBOutlet weak var votes_label: UILabel!
    @IBOutlet weak var movie_image: UIImageView!
    @IBOutlet weak var describtion: UITextView!
    
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        
        self.title_label.text = title_value
        self.date_label.text = date_value
        self.votes_label.text = vote_value
        movie_image.sd_setImage(with: URL(string: image_value), placeholderImage: UIImage(named: "placeholder.png"))
        self.describtion.text = describtion_value

    }
    

  

}
