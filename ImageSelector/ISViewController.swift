//
//  ISViewController.swift
//  ImageSelector
//
//  Created by Forrest Filler on 7/11/16.
//  Copyright © 2016 forrestfiller. All rights reserved.
//

import UIKit

class ISViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    var imagesTable: UITableView!
    
    override func loadView() {
        let frame = UIScreen.mainScreen().bounds
        let view = UIView(frame: frame)
        view.backgroundColor = .redColor()
        
        self.imagesTable = UITableView(frame: frame, style: .Plain)
        self.imagesTable.dataSource = self
        self.imagesTable.delegate = self
        view.addSubview(self.imagesTable)
        
        self.view = view
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(
            title: "Pick Image",
            style:  .Plain,
            target:  self,
            action:  nil
        )
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 20
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cellId = "cellId"
        if let cell = tableView.dequeueReusableCellWithIdentifier(cellId){
            cell.textLabel?.text = "\(indexPath.row)"
            return cell
        }
        
        let cell = UITableViewCell(style: .Subtitle, reuseIdentifier: cellId)
        cell.textLabel?.text = "\(indexPath.row)"
        return cell
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    


}
