//
//  ImageViewController.swift
//  ImageSelector
//
//  Created by Forrest Filler on 7/11/16.
//  Copyright © 2016 forrestfiller. All rights reserved.
//

import UIKit

class ImageViewController: UIViewController, UITextFieldDelegate {
    
    //add text field beow the image, and have a button that says :submit", it will becomes the caption of the image in the tableview
    
    var iSViewController: ISViewController!
    var selectedImage: UIImage!
    var captionField: UITextField!
    var captionButton: UIButton!
    //var tintColor: UIColor!
    
    

    override func loadView() {
        let frame = UIScreen.mainScreen().bounds
        let view = UIView(frame: frame)
        view.backgroundColor = .lightGrayColor()

        //ensures aspect ratio for rendered image is appropriate
        let width = frame.size.width
        let scale = width/self.selectedImage.size.width
        let height = scale*self.selectedImage.size.height
        
        let imageView = UIImageView(frame: CGRect(x: 10, y: 74, width: width-20, height: height))
        imageView.image = self.selectedImage
        view.addSubview(imageView)
        
        self.captionField = UITextField(frame: CGRect(x: 10, y: height+94/*340*/, width: width-20, height: 28))
        captionField.backgroundColor = .whiteColor()
        self.captionField.delegate = self
        view.addSubview(self.captionField)
        
        //320...160
        self.captionButton = UIButton(frame: CGRect(x: 120, y: height+164, width: 80, height: 22))
        captionButton.backgroundColor = .blueColor()
        //captionButton.titleLabel?.tintColor = .blackColor()
        //captionButton.contentHorizontalAlignment = .Center
        self.captionButton.setTitle("Submit", forState: .Highlighted)

        
        view.addSubview(self.captionButton)
        self.view = view
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let notificationCenter = NSNotificationCenter.defaultCenter()
        notificationCenter.addObserver(
            self,
            selector: #selector(ImageViewController.captionInputReturned(_:)), /*nil,*/
            name: "captionInputReturned",
            object: captionButton
        )
    }
    override func didReceiveMemoryWarning(){
        super.didReceiveMemoryWarning()
    }
    func captionInputReturned(notification: NSNotification){
        print("captionInputReturned: ")
        //self.captionButton.reloadData()
        //renders the images that were previously downloaded as raw data.
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        self.captionField.resignFirstResponder()
        //print("textFieldShouldReturn: ")
        let captionText = self.captionField.text!
        // some func that takes 'captionText' and passes to the tableview (*&*^$#^#)!)()()(((#$&&& !!!
        return true
    }
    func whenButtonTapped(target: UIButton, action: Selector, forControlEvents controlEvents: UIControlEvents) {
        // add target/action for particular event. you can call this multiple times and you can specify multiple target/actions for a particular event.
        // passing in nil as the target goes up the responder chain. The action may optionally include the sender and the event in that order
        // the action cannot be NULL. Note that the target is not retained.
    }

}
