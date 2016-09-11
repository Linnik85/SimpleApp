//
//  ALResponseHelper.swift
//  SimpleApp
//
//  Created by Линник Александр on 03.03.16.
//  Copyright © 2016 Alex Linnik. All rights reserved.
//

import UIKit

class ALResponseHelper: NSObject {
    
    class func errorFromResult (result:NSDictionary?) -> NSError? {
        return nil
    }
    
    class func getSalonsFromResult (result:NSDictionary?) -> Array<ALSalon> {
        var salonArray = [ALSalon]()
        var salonsArrayDict = [NSDictionary]()
        if let data = result?["salons"] as? NSArray {
            if let  salons = data as? [NSDictionary] {
                salonsArrayDict = salons
            }
        }
        for salonDict in salonsArrayDict {
            let salon = ALSalon(dictionary: salonDict)
                salonArray.append(salon)
        }
        return salonArray
    }
}
