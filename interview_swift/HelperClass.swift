//
//  HelperClass.swift
//  interview_swift
//
//  Created by awad Ibrahim on 06/01/2021.
//

import UIKit

class HelperClass: NSObject {
    let CONSTANTS = Definitions()
    func Validation_function(dic:NSMutableDictionary) -> NSMutableDictionary {
        
        if ((dic[CONSTANTS.MOVIE_TITLE]) == nil) {
            dic[CONSTANTS.MOVIE_TITLE] = "NO TITLE"

        }
                        
        if ((dic[CONSTANTS.RELEASE_DATE]) == nil) {
            dic[CONSTANTS.RELEASE_DATE] = "NOT SET"
            
        }

        
        if ((dic[CONSTANTS.VOTE_COUNT]) == nil) {
            dic[CONSTANTS.VOTE_COUNT] = "0"
        }

        if ((dic[CONSTANTS.MOVIE_OVERVIEW]) == nil) {
            dic[CONSTANTS.MOVIE_OVERVIEW] = "NO DESCRIBTION"

        }
        
        
        
        return dic
        
        
    }
}
