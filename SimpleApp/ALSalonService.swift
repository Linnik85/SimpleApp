//
//  ALSalonService.swift
//  SimpleApp
//
//  Created by Линник Александр on 11.09.16.
//  Copyright © 2016 Alex Linnik. All rights reserved.
//

import UIKit

class ALSalonService: ALBaseService {
    
    lazy var apiManager: ALApiManager? = {
        let apiManager = ALApiManager.sharedApiManager
        return apiManager
    }()
    
    static let salonService = ALSalonService()
    
    // MARK: - Requests -
    
    func salons(complition: objectBlock) {
        self.apiManager?.GET("salons", parameters: [], completion: { (responseObject, error, status) in
            self.callBlockWithSalonsResponse(responseObject, error: error, block: complition)
        })
    }
    
    // MARK: - Blocks -
    
    func callBlockWithSalonsResponse(responseObject:AnyObject?, error : NSError?, block : objectBlock) {
        if (error != nil) {
            block(result: [], error: error)
        }
        let result = ALResponseHelper.getSalonsFromResult(responseObject as? NSDictionary)
        if (responseObject != nil) {
            block(result: result, error: error)
        }
    }
}
