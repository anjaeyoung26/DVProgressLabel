//
//  DVProgressLabel.swift
//  DVProgressLabel
//
//  Created by 재영 on 2022/03/18.
//

import UIKit

public class DVProgressLabel: UILabel {
  public var progress: CGFloat = 0.0 {
    didSet {
      didFinishMasking = (progress >= 1.0)
    }
  }
  /// The stroke width of the text layer when masking.
  public var maskStrokeWidth: CGFloat = -1.5 {
    didSet {
      update(progress: progress)
    }
  }
  /// The stroke color of the text layer when masking.
  public var maskStrokeColor: UIColor = .black {
    didSet {
      update(progress: progress)
    }
  }
  /// The color that fills up when masking.
  public var maskColor: UIColor = .black {
    didSet {
      update(progress: progress)
    }
  }
  
  public var didFinishMasking: Bool = false
  public var currentMaskLayer: CATextLayer?
}


// MARK: - Public

public extension DVProgressLabel {
  func update(progress: CGFloat, completion: (() -> Void)? = nil) {
    guard let text = text else {
      completion?()
      return
    }
    
    let maskLayer = createTextLayer(text, font)
    let textSize = maskLayer.preferredFrameSize()
    
    var maskWidth: CGFloat = textSize.width
    
    if progress <= 1.0 {
      maskWidth *= progress
    }
    
    maskLayer.string = getAttributedString(text: text, font: font, foregroundColor: maskColor)
    maskLayer.frame = getTextFrame(layer: maskLayer)
    
    maskLayer.mask = createMaskLayer(CGRect(
      x: 0, y: 0,
      width: maskWidth,
      height: textSize.height
    ))
    
    if currentMaskLayer == nil {
      layer.addSublayer(maskLayer)
    } else {
      layer.replaceSublayer(currentMaskLayer!, with: maskLayer)
    }
    
    self.currentMaskLayer = maskLayer
    self.progress = progress
    completion?()
  }
  
  func refreshProgressMask() {
    if currentMaskLayer != nil {
      currentMaskLayer = nil
      ///
      layer.sublayers?.removeLast()
    }
    
    progress = 0.0
  }
}


// MARK: - Private

private extension DVProgressLabel {
  func createTextLayer(_ text: String, _ font: UIFont) -> CATextLayer {
    let textLayer = CATextLayer()
    textLayer.backgroundColor = UIColor.clear.cgColor
    textLayer.contentsScale = UIScreen.main.scale
    textLayer.fontSize = font.pointSize
    textLayer.string = text
    textLayer.font = font
    
    switch textAlignment {
    case .right: textLayer.alignmentMode = CATextLayerAlignmentMode.right
    case .left: textLayer.alignmentMode = CATextLayerAlignmentMode.left
    default: textLayer.alignmentMode = CATextLayerAlignmentMode.center
    }
    
    return textLayer
  }
  
  func createMaskLayer(_ holeRect: CGRect) -> CAShapeLayer {
    let path = CGMutablePath()
    path.addRect(holeRect)
    
    let layer = CAShapeLayer()
    layer.fillRule = CAShapeLayerFillRule.evenOdd
    layer.opacity = 1
    layer.path = path
    
    return layer
  }
  
  func getTextFrame(layer: CATextLayer?) -> CGRect {
    guard let layer = layer else { return .zero }
    
    let preferredFrameSize = layer.preferredFrameSize()
    let preferredFrameWidth = preferredFrameSize.width
    let preferredFrameHeight = preferredFrameSize.height
    
    var xPos: CGFloat
    
    switch textAlignment {
    case .left:
      xPos = 0
    case .right:
      xPos = frame.width - preferredFrameWidth
    default:
      xPos = (frame.width - preferredFrameWidth) / 2
    }
    
    return CGRect(
      x: xPos,
      y: 0,
      width: preferredFrameWidth,
      height: preferredFrameHeight
    )
  }
  
  func getAttributedString(
    text: String,
    font: UIFont,
    foregroundColor: UIColor
  ) -> NSAttributedString {
    let attributes = [
      NSAttributedString.Key.foregroundColor: foregroundColor,
      NSAttributedString.Key.strokeWidth: maskStrokeWidth,
      NSAttributedString.Key.strokeColor: maskStrokeColor,
      NSAttributedString.Key.font: font
    ] as [NSAttributedString.Key: Any]
    
    return NSAttributedString(string: text, attributes: attributes)
  }
}

