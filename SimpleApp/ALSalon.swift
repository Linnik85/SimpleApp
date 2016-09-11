//
//  ALSalon.swift
//  SimpleApp
//
//  Created by Линник Александр on 11.09.16.
//  Copyright © 2016 Alex Linnik. All rights reserved.
//

import UIKit

class ALSalon: NSObject {
    
    var name = ""
    var block = ""
    var avenue = ""
    var street = ""
    var building = ""
    var province = ""
    var area = ""
    var country = ""
    var location_instructions = ""
    var zip_code = ""
    var is_favorite = false
    var is_home = false
    var phone = ""
    var descriptions = ""
    var instagram = ""
    var website = ""
    var lng : Int64 = 0
    var lat : Int64 = 0
    var min_price : Int64 = 0
    var type : Int64 = 0
    var hidden = false
    var originProfileUrl = ""

    init(dictionary:NSDictionary){
        if let name = dictionary["name"] as? String {
            self.name = name
        }
        if let block = dictionary["block"] as? String {
            self.block = block
        }
        if let avenue = dictionary["avenue"] as? String {
            self.avenue = avenue
        }
        if let street = dictionary["street"] as? String {
            self.street = street
        }
        if let building = dictionary["building"] as? String {
            self.building = building
        }
        if let province = dictionary["province"] as? String {
            self.province = province
        }
        if let area = dictionary["area"] as? String {
            self.area = area
        }
        if let country = dictionary["country"] as? String {
            self.country = country
        }
        if let location_instructions = dictionary["location_instructions"] as? String {
            self.location_instructions = location_instructions
        }
        if let zip_code = dictionary["zip_code"] as? String {
            self.zip_code = zip_code
        }
        if let is_favorite = dictionary["is_favorite"] as? NSNumber {
            self.is_favorite = is_favorite.boolValue
        }
        if let is_home = dictionary["is_home"] as? NSNumber {
            self.is_home = is_home.boolValue
        }
        if let phone = dictionary["phone"] as? String {
            self.phone = phone
        }
        if let description = dictionary["description"] as? String {
            self.descriptions = description
        }
        if let instagram = dictionary["instagram"] as? String {
            self.instagram = instagram
        }
        if let website = dictionary["website"] as? String {
            self.website = website
        }
        if let lng = dictionary["lng"] as? NSNumber {
            self.lng = lng.longLongValue
        }
        if let lat = dictionary["lat"] as? NSNumber {
            self.lat = lat.longLongValue
        }
        if let min_price = dictionary["min_price"] as? NSNumber {
            self.min_price = min_price.longLongValue
        }
        if let type = dictionary["type"] as? NSNumber {
            self.type = type.longLongValue
        }
        if let hidden = dictionary["hidden"] as? NSNumber {
            self.hidden = hidden.boolValue
        }
        if let profile_image_urls = dictionary["profile_image_urls"] as? NSDictionary {
            if let originProfileUrl = profile_image_urls ["original"] as? String  {
                self.originProfileUrl = originProfileUrl
            }
        }
    }
}
