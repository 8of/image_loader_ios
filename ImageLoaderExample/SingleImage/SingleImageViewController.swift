//
//  SingleImageViewController.swift
//  ImageLoaderExample
//
//  Created by Andrei Konstantinov on 30/08/2019.
//  Copyright © 2019 Test. All rights reserved.
//

import UIKit

final class SingleImageViewController: UIViewController {

  private let manager: SingleImageManagerType!

  @IBOutlet private weak var imageView: ProgressUIImageView! {
    didSet {
      imageView.layer.cornerRadius = imageView.bounds.width / 2
      imageView.clipsToBounds = true
      imageView.image = manager.getPlaceholderImage()
    }
  }

  init(manager: SingleImageManagerType) {
    self.manager = manager
    super.init(nibName: "SingleImageViewController", bundle: nil)
  }

  required init?(coder aDecoder: NSCoder) {
    fatalError("Not implemented")
  }

}

// MARK: - Private

private extension SingleImageViewController {

  func loadNextImage() {
    imageView.loadImageWithProgress(
      url: manager.getRandomImageUrl(),
      placeholder: manager.getPlaceholderImage()
    )
  }

  @IBAction func loadImageAction() {
    loadNextImage()
  }

}
