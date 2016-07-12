//
//  ImageViewController.swift
//  ImageSelector
//
//  Created by Forrest Filler on 7/11/16.
//  Copyright © 2016 forrestfiller. All rights reserved.
//

import UIKit

class ImageViewController: UIViewController {
    
    var selectedImage: UIImage!
    
    override func loadView() {
        let frame = UIScreen.mainScreen().bounds
        let view = UIView(frame: frame)
        view.backgroundColor = .whiteColor()
        
        //ensures aspect ratio is not lost when hard coded.
        let width = frame.size.width
        let scale = width/self.selectedImage.size.width
        let height = scale*self.selectedImage.size.height
        
        
        let imageView = UIImageView(frame: CGRect(x: 0, y: 120, width: width, height: height))
        imageView.image = self.selectedImage
        view.addSubview(imageView)
        
        
        self.view = view
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
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
