//
//  Movies_listViewController.swift
//  interview_swift
//
//  Created by awad Ibrahim on 05/01/2021.
//

import UIKit
import SDWebImage
import ZVProgressHUD


//import AFNetworking

class Movies_listViewController: UIViewController {
    
    @IBOutlet weak var collection_view: UICollectionView!
   
    var selectedDictionary = NSMutableDictionary()
    let CONSTANTS = Definitions()
    let album = Album()
    let validation = HelperClass()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.collection_view.dataSource=self;
        self.collection_view.delegate=self;

        ZVProgressHUD .show(with: "Loading")
        UIApplication.shared.beginIgnoringInteractionEvents()
        
        album .method(arg: true, completion: { (success) -> Void in
            
            ZVProgressHUD .dismiss()
            UIApplication.shared.endIgnoringInteractionEvents()

            if success {
                
                print(self.album.Movies_list)
                self.collection_view .reloadData()
            }
            else
            {
                
                let alert = UIAlertController(title: "Error!", message: "Something Went wrong, please try again", preferredStyle: UIAlertController.Style.alert)
                alert.addAction(UIAlertAction(title: "Close", style: UIAlertAction.Style.default, handler: nil))
                self.present(alert, animated: true, completion: nil)
                
            }
        })
    }
  
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     
        
        if segue.identifier == CONSTANTS.MOVIE_DETAILS_IDENTFIER {
            
            let destinationView = segue.destination as! Movie_detailsViewController
            
            // -------------- some of the values are empty, this is to give it a value ----------------//

            selectedDictionary = validation .Validation_function(dic: selectedDictionary)
            
            
                destinationView.title_value = selectedDictionary[CONSTANTS.MOVIE_TITLE] as! String
                destinationView.date_value = selectedDictionary[CONSTANTS.RELEASE_DATE] as! String
                destinationView.vote_value = String .localizedStringWithFormat("%@", selectedDictionary[CONSTANTS.VOTE_COUNT] as! NSNumber)
                destinationView.describtion_value = selectedDictionary[CONSTANTS.MOVIE_OVERVIEW] as! String
            let url_string =  String .localizedStringWithFormat("%@%@", CONSTANTS.IMAGE_URL_BASE,selectedDictionary[CONSTANTS.POSTER_PATH] as! CVarArg)
                destinationView.image_value = url_string

        }
    }

    
}


extension Movies_listViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: self.view.coordinateSpace.bounds.width-100 , height: self.view.coordinateSpace.bounds.height-100 )
    }
}

extension Movies_listViewController :UICollectionViewDelegate{
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
       
        selectedDictionary = NSMutableDictionary(dictionary:album.Movies_list[indexPath.row])
     print(selectedDictionary)
        self .performSegue(withIdentifier: CONSTANTS.MOVIE_DETAILS_IDENTFIER, sender: self)

    }
}


extension Movies_listViewController :UICollectionViewDataSource{
   
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell=collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath);
        
        let dataDictioanry =  album.Movies_list[indexPath.row];

        let image = cell.contentView.viewWithTag(1) as! UIImageView

        let url_string =  String .localizedStringWithFormat("%@%@", CONSTANTS.IMAGE_URL_BASE,dataDictioanry[CONSTANTS.POSTER_PATH] as! CVarArg)
        image.sd_setImage(with: URL(string: url_string), placeholderImage: UIImage(named: "placeholder.png"))


        return cell;
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return album.Movies_list .count
    }
}


