//
//  ImageCollectionViewController.swift
//  ImgNest
//
//  Created by Ivan Sergeyenko on 2016-03-29.
//  Copyright © 2016 Bruce and Willis. All rights reserved.
//

import UIKit

class ImageCollectionViewController: UICollectionViewController {

  let imageService = ImageServiceProd()
  var images = Array<UIImage>()

  override func viewDidLoad() {
    super.viewDidLoad()

    imageService.fetchImages { images in
      self.images = images
      self.collectionView?.reloadData()
    }
  }
  
  override func collectionView(collectionView: UICollectionView,
      numberOfItemsInSection section: Int) -> Int {
    return self.images.count
  }

  override func collectionView(collectionView: UICollectionView,
      cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {

   let cell = collectionView.dequeueReusableCellWithReuseIdentifier("Cell",
       forIndexPath: indexPath)
   let imageView = cell.viewWithTag(42) as! UIImageView
   let image = self.images[indexPath.row]
   print("image: \(image)")
   imageView.image = self.images[indexPath.row]
   
   return cell
  }
  
  override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
    if (segue.identifier == "showImage") {
      let viewController = segue.destinationViewController
        as! ImageViewController
      let indexPath = self.collectionView!.indexPathsForSelectedItems()!.first!
      let image = self.images[indexPath.row]
      viewController.image = image
    }
  }
}
