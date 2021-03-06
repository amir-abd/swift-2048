//
//  TileView.swift
//  swift-2048
//
//  Created by Austin Zheng on 6/3/14.
//  Copyright (c) 2014 Austin Zheng. All rights reserved.
//

import UIKit

/// A view representing a single swift-2048 tile.
class TileView : UIView {
  // This should be unowned. But there is a bug preventing 'unowned' from working correctly with protocols.
  var delegate: AppearanceProviderProtocol
  var value: Int = 0 {
  didSet {
    backgroundColor = delegate.tileColor(value)
    numberLabel.textColor = delegate.numberColor(value)
    numberLabel.text = "\(value)"
  }
  }
  var numberLabel: UILabel
    
  required init?(coder: NSCoder) {
    fatalError("NSCoding not supported")
  }
    
  init(position: CGPoint, width: CGFloat, value: Int, radius: CGFloat, delegate d: AppearanceProviderProtocol) {
    delegate = d
    numberLabel = UILabel(frame: CGRect(x: 0, y: 0, width: width, height: width))
    numberLabel.textAlignment = NSTextAlignment.center
    numberLabel.minimumScaleFactor = 0.5
    numberLabel.font = delegate.fontForNumbers()

    super.init(frame: CGRect(x: position.x, y: position.y, width: width, height: width))
    addSubview(numberLabel)
    layer.cornerRadius = radius

    self.value = value
    backgroundColor = delegate.tileColor(value)
    numberLabel.textColor = delegate.numberColor(value)
    numberLabel.text = "\(value)"
  }
}
