//
//  SingleImageAssembly.swift
//  ImageLoaderExample
//
//  Created by Andrei Konstantinov on 30/08/2019.
//  Copyright © 2019 Test. All rights reserved.
//

import UIKit.UIViewController

final class SingleImageAssembly {

  let view: SingleImageViewController

  init() {
    let manager = SingleImageManager()
    view = SingleImageViewController(manager: manager)
  }

}
