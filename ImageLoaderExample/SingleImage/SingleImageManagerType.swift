//
//  SingleImageManagerType.swift
//  ImageLoaderExample
//
//  Created by Andrei Konstantinov on 30/08/2019.
//  Copyright © 2019 Test. All rights reserved.
//

import UIKit.UIImage

protocol SingleImageManagerType {

  func getRandomImageUrl() -> String
  func getPlaceholderImage() -> UIImage

}
