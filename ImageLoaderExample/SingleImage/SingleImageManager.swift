//
//  SingleImageManager.swift
//  ImageLoaderExample
//
//  Created by Andrei Konstantinov on 30/08/2019.
//  Copyright © 2019 Test. All rights reserved.
//

import UIKit.UIImage

final class SingleImageManager {

}

// MARK: - SingleImageManagerType

extension SingleImageManager: SingleImageManagerType {

  func getRandomImageUrl() -> String {
    let randomInt = Int.random(in: 0 ... 10)
    return "https://placem.at/things?w=3000&h=3000&random=\(randomInt)"
  }

  func getPlaceholderImage() -> UIImage {
    return UIImage(named: "placeholder")!;
  }

}
