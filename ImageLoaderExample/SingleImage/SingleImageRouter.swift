//
//  SingleImageRouter.swift
//  ImageLoaderExample
//
//  Created by Andrei Konstantinov on 30/08/2019.
//  Copyright © 2019 Test. All rights reserved.
//

import UIKit.UIViewController

final class SingleImageRouter {

  func setupRootViewController(on viewController: UIViewController?) {
    guard let navigationController = viewController as? UINavigationController else {
      assert(viewController is UINavigationController, "Should be UINavigationController")
      return;
    }
    let assembly = SingleImageAssembly()
    navigationController.viewControllers = [assembly.view]
  }

}
