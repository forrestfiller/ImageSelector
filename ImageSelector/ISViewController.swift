//
//  ISViewController.swift
//  ImageSelector
//
//  Created by Forrest Filler on 7/11/16.
//  Copyright © 2016 forrestfiller. All rights reserved.
//

import UIKit

class ISViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, UIImagePickerControllerDelegate,  UINavigationControllerDelegate {
    
    var imagesTable: UITableView!
    var imagesArray = Array<ISimage>() //instansiate this array right away
    var _image: ImageViewController!
    
    
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
            action:  #selector(ISViewController.selectPhotoSource)
        )
    }
    
    func selectPhotoSource(){
        //print("selectPhotoSource")
        
        let actionSheet = UIAlertController(
            title: "Select Image Source",
            message: nil,
            preferredStyle: .ActionSheet
        )
        
        actionSheet.addAction(UIAlertAction(title: "Camera", style: .Default, handler: { action in
            let imagePicker = UIImagePickerController()
            imagePicker.delegate = self
            imagePicker.sourceType = .Camera //the camera will crash the simulator! use .PhotoLibrary
            self.presentViewController(imagePicker, animated: true, completion: nil)
        }))
        
        actionSheet.addAction(UIAlertAction(title: "Photo Library", style: .Default, handler: { action in
            let imagePicker = UIImagePickerController()
            imagePicker.delegate = self
            imagePicker.sourceType = .PhotoLibrary
            self.presentViewController(imagePicker, animated: true, completion: nil)
        }))
        
        self.presentViewController(actionSheet, animated: true, completion: nil)
        
    }
    func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : AnyObject]){
        print("didFinishPickingMediaWithInfo: \(info)")
        if let selectedImage = info[UIImagePickerControllerOriginalImage] as? UIImage {
            self.imagesArray.append(selectedImage)
            
            self.imagesTable.reloadData()
            picker.dismissViewControllerAnimated(true, completion: nil)
        }

    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.imagesArray.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let _image = imagesArray[indexPath.row]
        let cellId = "cellId"
        if let cell = tableView.dequeueReusableCellWithIdentifier(cellId){
            cell.textLabel?.text = "\(indexPath.row)"
            cell.imageView?.image = _image.image
            return cell
        }
        
        let cell = UITableViewCell(style: .Subtitle, reuseIdentifier: cellId)
        cell.textLabel?.text = "\(indexPath.row)"
        cell.imageView?.image = _image.image
        return cell
    }
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath){
        //animate cell when selected:
        tableView.deselectRowAtIndexPath(tableView.indexPathForSelectedRow!, animated: true)
        // seque to new instaVc:
//        let _image = self.imagesArray[indexPath.row]
//        let imageVc = ImageViewController()
//        imageVc.selectedImage = _image.image
//        self.navigationController?.pushViewController(imageVc, animated: true)
        //print("segued to new vc: ")
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    


}
