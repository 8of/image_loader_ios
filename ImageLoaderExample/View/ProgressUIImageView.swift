//
//  ProgressUIImageView.swift
//  ImageLoaderExample
//
//  Created by Andrei Konstantinov on 30/08/2019.
//  Copyright © 2019 Test. All rights reserved.
//

import UIKit

final class ProgressUIImageView: UIImageView {

  private var lineWidth:CGFloat = 5 {
    didSet{
      progressLayer.lineWidth = lineWidth
    }
  }

  private let progressLayer = CAShapeLayer()
  private var radius: CGFloat {
    get {
      if frame.width < frame.height { return (frame.width - lineWidth)/2 }
      else { return (frame.height - lineWidth)/2 }
    }
  }

  private var pathCenter: CGPoint{ get{ return convert(center, from:superview) } }
  private var layoutDone = false

  private var observation: NSKeyValueObservation?

  deinit {
    observation?.invalidate()
  }

  override func awakeFromNib() {
    super.awakeFromNib()
    setupView()
  }

  override func layoutSublayers(of layer: CALayer) {
    if !layoutDone {
      setupView()
      layoutDone = true
    }
  }

  func loadImageWithProgress(url urlString: String, placeholder: UIImage? = nil) {
    let task = load(url: urlString, placeholder: placeholder)
    observation = task?.progress.observe(\.fractionCompleted) { [weak self] progress, _ in
      DispatchQueue.main.async {
        if (progress.fractionCompleted >= 1.0) {
          self?.observation?.invalidate()
          self?.observation = nil
        }
        self?.setProgress(to: progress.fractionCompleted)
      }
    }
    task?.resume()
  }

}

// MARK: - Private

private extension ProgressUIImageView {

  func setProgress(to progressConstant: Double) {

    var progress: Double {
      get {
        if progressConstant > 1 { return 1 }
        else if progressConstant < 0 { return 0 }
        else { return progressConstant }
      }
    }
    progressLayer.strokeEnd = CGFloat(progress)
    setProgressLayer(isHidden: progress == 1)
  }

  func setProgressLayer(isHidden: Bool) {
    if (isHidden) {
      progressLayer.strokeEnd = 0
    }
    guard progressLayer.isHidden != isHidden else { return }
    progressLayer.isHidden = isHidden
  }

  func makeBar() {
    layer.sublayers = nil
    drawProgressLayer()
  }

  func drawProgressLayer() {

    let startAngle = (-CGFloat.pi/2)
    let endAngle = 2 * CGFloat.pi + startAngle

    let path = UIBezierPath(arcCenter: pathCenter, radius: radius, startAngle: startAngle, endAngle: endAngle, clockwise: true)

    progressLayer.lineCap = CAShapeLayerLineCap.round
    progressLayer.path = path.cgPath
    progressLayer.lineWidth = lineWidth
    progressLayer.fillColor = UIColor.clear.cgColor
    progressLayer.strokeColor = UIColor.green.cgColor
    progressLayer.strokeEnd = 0

    layer.addSublayer(progressLayer)
  }

  func setupView() {
    makeBar()
  }

}
