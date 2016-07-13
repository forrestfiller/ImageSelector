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
        
        let imageView = UIImageView(frame: CGRect(x: 20, y: 64, width: width-40, height: height))
        imageView.image = self.selectedImage
        view.addSubview(imageView)
        
        self.captionField = UITextField(frame: CGRect(x: 10, y: 340, width: width-20, height: 30))
        captionField.backgroundColor = .whiteColor()
        self.captionField.delegate = self
        view.addSubview(self.captionField)
        
        self.captionButton = UIButton(frame: CGRect(x: 10, y: 460, width: width-20, height: 24))
        captionButton.backgroundColor = .blueColor()
        //captionButton.titleLabel?.tintColor = .blackColor()
        captionButton.contentHorizontalAlignment = .Center
        self.captionButton.setTitle("Submit", forState: .Highlighted)

        
        view.addSubview(self.captionButton)
        self.view = view
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        

    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        self.captionField.resignFirstResponder()
        print("textFieldShouldReturn: ")
        let captionText = self.captionField.text!
        // some func that takes 'captionText' and passes to the tableview (*&*^$#^#)!)()()(((#$&&& !!!
        return true
    }
    
    
    // add target/action for particular event. you can call this multiple times and you can specify multiple target/actions for a particular event.
    // passing in nil as the target goes up the responder chain. The action may optionally include the sender and the event in that order
    // the action cannot be NULL. Note that the target is not retained.
    func whenButtonTapped(target: UIButton, action: Selector, forControlEvents controlEvents: UIControlEvents) {

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
