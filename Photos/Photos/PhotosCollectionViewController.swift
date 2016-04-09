//
//  PhotosCollectionViewController.swift
//  Photos
//
//  Created by Gene Yoo on 11/3/15.
//  Copyright © 2015 iOS DeCal. All rights reserved.
//

import UIKit

class PhotosCollectionViewController: UICollectionViewController {
    @IBOutlet weak var refreshButton: UIBarButtonItem!
    
    @IBOutlet var myCollectionView: UICollectionView!
    
    @IBAction func touchButton(sender: AnyObject) {
        let api = InstagramAPI()
        api.loadPhotos(didLoadPhotos)
        self.myCollectionView.reloadData()
    }
    var photos: [Photo]!
    
    var instagramImages = [UIImage]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let api = InstagramAPI()
        api.loadPhotos(didLoadPhotos)
        // FILL ME IN
        
        //print("HI")
    }
    
    override func preferredStatusBarStyle() -> UIStatusBarStyle {
        return UIStatusBarStyle.LightContent
    }

    /* 
     * IMPLEMENT ANY COLLECTION VIEW DELEGATE METHODS YOU FIND NECESSARY
     * Examples include cellForItemAtIndexPath, numberOfSections, etc.
     */
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if (segue.identifier == "photoDetails") {
            let photoDetailViewController = segue.destinationViewController as! PhotoDetailViewController
            if let cell = sender as? UICollectionViewCell, indexPath = collectionView!.indexPathForCell(cell) {
                // use indexPath
                
                photoDetailViewController.imageDetail = UIImage(data: NSData(contentsOfURL: NSURL(string: photos[indexPath.row].url)!)!)!
                photoDetailViewController.numberLikesDetail = "\(photos[indexPath.row].likes)"
                photoDetailViewController.usernameDetail = photos[indexPath.row].username
                photoDetailViewController.dateDetail = photos[indexPath.row].created_time
            }
        }
    }
    
    override func collectionView(collectionView: UICollectionView,
                                 cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell{
        
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("Cell", forIndexPath: indexPath) as! PhotosCollectionViewCell
        
        if photos != nil{
            let url = NSURL(string: photos[indexPath.row].url)!
            
            let data = NSData(contentsOfURL: url)!
            
            let image = UIImage(data: data)
            //let image = UIImage(named: carImages[indexPath.row])
            cell.imageView.image = image
        }
        
        return cell
    }
    
    
    override func numberOfSectionsInCollectionView(collectionView:
        UICollectionView) -> Int {
        return 1
    }
    
    override func collectionView(collectionView: UICollectionView,
                                 numberOfItemsInSection section: Int) -> Int {
        if photos == nil{
            return 0
        } else{
            return photos.count
        }
        
    }

    
    func loadImageForCell(photo: Photo, imageView: UIImageView) {
        //downloadImage(NSURL(fileURLWithPath: photo.url))
        let url = NSURL(string: photo.url)!
        
        let data = NSData(contentsOfURL: url)!
        
        let image = UIImage(data: data)
        
        imageView.image = image
    }
    
    
    
    /* Completion handler for API call. DO NOT CHANGE */
    func didLoadPhotos(photos: [Photo]) {
        self.photos = photos
        self.collectionView!.reloadData()
    }
    
}

