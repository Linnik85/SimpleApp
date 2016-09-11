//
//  ALApiManager.swift
//  SimpleApp
//
//  Created by Линник Александр on 11.09.16.
//  Copyright © 2016 Alex Linnik. All rights reserved.
//

import UIKit
import Alamofire

typealias responseBlock = (responseObject :AnyObject?, error:NSError? , status : NSInteger) -> Void
typealias objectBlock = (result :AnyObject?, error:NSError?) -> Void

class ALApiManager: NSObject {
    static let sharedApiManager = ALApiManager()
    var alamoFireManager = Alamofire.Manager.sharedInstance
    
    func GET(URLString:String, parameters:AnyObject, completion:responseBlock){
        
        self.alamoFireManager.request(.GET, Constants.Host.BaseURL+URLString, parameters: parameters as? [String : AnyObject], encoding: .URL).responseJSON(completionHandler: { response in
            if let JSON = response.result.value{
                self._callBlockWithResponse(completion, responseObject: JSON, status: (response.response?.statusCode)!)
            } else {
                self._callBlockWithError(completion, error: response.result.error!, status:0)
            }
        })
    }
    
    private func _callBlockWithResponse(block:responseBlock, responseObject: AnyObject, status : NSInteger){
        let error = ALResponseHelper.errorFromResult(responseObject as? NSDictionary)
        block(responseObject: responseObject, error: error, status: status)
    }
    
    private func _callBlockWithError(block:responseBlock, error: NSError, status : NSInteger){
        block(responseObject: nil, error: error, status: status)
    }

}
