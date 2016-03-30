//
//  ImageService.swift
//  ImgNest
//
//  Created by Ivan Sergeyenko on 2016-03-29.
//  Copyright © 2016 Bruce and Willis. All rights reserved.
//

import UIKit
import SwiftHTTP


protocol ImageService {
  func fetchImages(completion: ((images: Array<UIImage>) -> Void))
}

class ImageServiceTest : ImageService {
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

class ImageServiceProd : ImageService {

  let galleryURL = "https://api.imgur.com/3/gallery/r/aww/0.json"
  let clientID = "571e513e26d20b1"

  func fetchImages(completion: ((images: Array<UIImage>) -> Void)) {
    do {
      let request = try HTTP.GET(self.galleryURL,
          headers: ["Authorization": "Client-ID \(self.clientID)"])
      request.start { response in
        print("response: \(response.description)")
      }
    } catch let error {
      print("couldn't serialize the paraemeters: \(error)")
    }
  }
}
