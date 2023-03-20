//
//  Images.swift
//  Borzenko-Shopellio
//
//  Created by Natalia Borzenko on 12/03/2023.
//

import SwiftUI

extension Image {
  static let infoCircle = Image(systemName: "info.circle")
  static let emptyCircle = Image(systemName: "circle")
  static let checkmarkCircle = Image(systemName: "checkmark.circle")
  static let cart = Image(systemName: "cart")
  static let squareStack = Image(systemName: "square.stack.3d.down.right")
  static let flame = Image(systemName: "flame")
  static let photo = Image(systemName: "photo")
  static let plusCircle = Image(systemName: "plus.circle")
  static let minusCircle = Image(systemName: "minus.circle")
}

struct Image_Previews: PreviewProvider {
  static var previews: some View {
    VStack(spacing: 16) {
      Image.infoCircle
      Image.emptyCircle
      Image.checkmarkCircle
      Image.cart
      Image.squareStack
      Image.flame
      Image.photo
      Image.plusCircle
      Image.minusCircle
    }
  }
}
