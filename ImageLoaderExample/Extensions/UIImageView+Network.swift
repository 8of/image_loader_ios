//
//  UIImageView+Network.swift
//  ImageLoaderExample
//
//  Created by Andrei Konstantinov on 30/08/2019.
//  Copyright © 2019 Test. All rights reserved.
//

import Foundation
import UIKit

@objc extension UIImageView {

  func load(url urlString: String, placeholder: UIImage? = nil) -> URLSessionDataTask? {
    if let placeholder = placeholder {
      image = placeholder
    } else {
      image = nil
    }

    guard let url = URL(string: urlString) else { return nil }

    let task = URLSession.shared.dataTask(
      with: url,
      completionHandler: { [weak self] (data, response, error) in
        guard error == nil,
          let data = data,
          let image = UIImage(data: data)
          else { return }
        DispatchQueue.main.async {
          self?.image = image
        }
    })
    return task
  }

}
