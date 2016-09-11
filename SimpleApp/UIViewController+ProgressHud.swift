//
//  UIViewController+ProgressHud.swift
//  SimpleApp
//
//  Created by Линник Александр on 06.03.16.
//  Copyright © 2016 Alex Linnik. All rights reserved.
//

import UIKit
import SVProgressHUD

extension UIViewController {
    
    func showLoading() {
        SVProgressHUD.setBackgroundColor(UIColor.blackColor())
        SVProgressHUD.setForegroundColor(UIColor.whiteColor())
        SVProgressHUD.setDefaultMaskType(SVProgressHUDMaskType.Gradient)
        SVProgressHUD.setRingThickness(5.0)
        SVProgressHUD.show()
    }
    
    func hideLoading() {
    SVProgressHUD.dismiss()
    }
    
    func showSuccesWithStatus(status:String) {
        SVProgressHUD.showSuccessWithStatus(status)

    }
}