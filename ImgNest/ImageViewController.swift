//
//  ImageViewController.swift
//  ImgNest
//
//  Created by Ivan Sergeyenko on 2016-03-29.
//  Copyright © 2016 Bruce and Willis. All rights reserved.
//

import UIKit

class ImageViewController: UIViewController {

  var image: UIImage!

  @IBOutlet weak var imageView: UIImageView!
  override func viewDidLoad() {
    super.viewDidLoad()

    self.imageView!.image = self.image
  }
}
