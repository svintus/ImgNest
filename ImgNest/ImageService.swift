//
//  ImageService.swift
//  ImgNest
//
//  Created by Ivan Sergeyenko on 2016-03-29.
//  Copyright © 2016 Bruce and Willis. All rights reserved.
//

import UIKit

protocol ImageService {
  func fetchImages(completion: ((images: Array<UIImage>) -> Void))
}

class ImageServiceTest {
  func fetchImages(completion: ((images: Array<UIImage>) -> Void)) {
    let images = [
      "img1",
      "img2",
      "img3",
      "img4",
      "img5",
    ].map{UIImage(named: $0)!}
    completion(images: images)
  }
}
