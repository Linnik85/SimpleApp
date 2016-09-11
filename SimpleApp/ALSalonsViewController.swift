//
//  ALSalonsViewController.swift
//  SimpleApp
//
//  Created by Линник Александр on 11.09.16.
//  Copyright © 2016 Alex Linnik. All rights reserved.
//

import UIKit

class ALSalonsViewController: ALBaseViewController, UITableViewDataSource, UITableViewDelegate  {
    
    // MARK: - Constant -
    
    let kNavigationBarWithTitle:String = "Salons"
    
    // MARK: - Properties -
    
    @IBOutlet weak var tableView: UITableView!
    var dataSource = [ALSalon]()
    
    // MARK: - Lifecycle -

    override func viewDidLoad() {
        super.viewDidLoad()
        self._initialSetup()
        self.fetchSalons()
    }
    
    // MARK: - Private -
    
    private func fetchSalons() {
        self.showLoading()
        ALSalonService.salonService.salons { (result, error) in
            self.hideLoading()
            if (error != nil) {
                self._showReloadAlert()
            } else {
                if let data = result as? NSArray {
                    self.dataSource = data as! [ALSalon]
                    self.tableView.reloadData()
                }
            }
        }
    }
    
    private func _showReloadAlert() {
        let alertController = UIAlertController(title: "Connection error", message: "Missing connection to the internet.", preferredStyle: .Alert)
        let reloadAction = UIAlertAction(title: "Reload", style: .Default) { (action) in
            self.fetchSalons()
        }
        alertController.addAction(reloadAction)
        self.presentViewController(alertController, animated: true){
        }
    }
    
    private func _initialSetup() {
        self.title = kNavigationBarWithTitle
    }
    
    // MARK: - UITableViewDataSource -
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.dataSource.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier(NSStringFromClass(ALSalonTableViewCell)) as! ALSalonTableViewCell
        cell.initWithSalon(self.dataSource[indexPath.row])
        return cell
    }
}
