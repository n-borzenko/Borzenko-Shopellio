//
//  Stock.swift
//  BorzenkoShopellio
//
//  Created by Natalia Borzenko on 19/03/2023.
//

import SwiftUI

struct ProductVariant: Equatable, Codable {
  let color: String
  let size: String

  static func == (lhs: ProductVariant, rhs: ProductVariant) -> Bool {
    return lhs.color == rhs.color && lhs.size == rhs.size
  }
}

enum StockLevel: String, Codable {
  case none = "Out of stock"
  case low = "Low availability"
  case normal = "In stock"

  var color: Color {
    switch self {
    case .none: return .red
    case .low: return .orange
    case .normal: return .green
    }
  }

  var image: Image {
    switch self {
    case .none: return Image.tray
    case .low: return Image.trayFill
    case .normal: return Image.trayTwoFill
    }
  }
}

struct StockItem: Codable {
  let variant: ProductVariant
  let level: StockLevel
}
