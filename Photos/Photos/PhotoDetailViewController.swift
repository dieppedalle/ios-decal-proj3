//
//  PhotoDetailViewController.swift
//  Photos
//
//  Created by Gauthier Dieppedalle on 4/8/16.
//  Copyright © 2016 iOS DeCal. All rights reserved.
//

import UIKit

class PhotoDetailViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var numberLikes: UILabel!
    @IBOutlet weak var didLiked: UIImageView!
    @IBOutlet weak var username: UILabel!
    @IBOutlet weak var date: UILabel!
    
    
    var imageDetail: UIImage = UIImage()
    var numberLikesDetail: String = ""
    var didLikedDetail: Bool = false
    var usernameDetail: String = ""
    var dateDetail: String = ""
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        imageView.image = imageDetail
        numberLikes.text = numberLikesDetail + " Likes"
        //print(usernameDetail)
        username.text = usernameDetail
        date.text = "\(NSDate(timeIntervalSince1970: Double(dateDetail)!))"
        // Do any additional setup after loading the view.
        
        didLiked.userInteractionEnabled = true
        let tapRecognizer = UITapGestureRecognizer(target: self, action: #selector(PhotoDetailViewController.imageTapped(_:)))
        didLiked.addGestureRecognizer(tapRecognizer)
    }
    
    func imageTapped(gestureRecognizer: UITapGestureRecognizer) {
        //tappedImageView will be the image view that was tapped.
        //dismiss it, animate it off screen, whatever.
        //let tappedImageView = gestureRecognizer.view!
        if didLikedDetail == false{
            didLiked.image = UIImage(named: "heart_fill")
            didLikedDetail = true
            numberLikes.text = String(Int(numberLikesDetail)! + 1) + " Likes"
            
        }
        else{
            didLiked.image = UIImage(named: "heart_white")
            didLikedDetail = false
            numberLikes.text = numberLikesDetail + " Likes"
        }
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
