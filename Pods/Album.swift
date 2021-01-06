//
//  Album.swift
//  interview_swift
//
//  Created by awad Ibrahim on 06/01/2021.
//

import UIKit
import Alamofire


class Album: NSObject {
    var Movies_list:[NSDictionary] = []

    func method(arg: Bool, completion: @escaping (Bool) -> ()) {
        
        Alamofire.request("https://api.themoviedb.org/3/trending/all/day?api_key=a09d5fdc2754ca0b5a63f9976c9c52e2").responseJSON { response in

            if ((response.data?.count) != nil) {
         
                if let JSON_DATA = response.result.value {
                        
                        print("JSON: \(JSON_DATA)")
                    let movies = JSON_DATA as! NSDictionary
                    self.Movies_list = movies["results"] as! Array
                    print(self.Movies_list)
                        completion(true)
                           }

            }else{
                completion(false)

            }
                     

        }
       
    }
        
}


