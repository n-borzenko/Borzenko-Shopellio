//
//  FeatureList.swift
//  BorzenkoShopellio
//
//  Created by Natalia Borzenko on 19/02/2023.
//

import Foundation

struct Feature: Hashable {
  let title: String
  let implemented: Bool

  init(title: String, implemented: Bool = false) {
    self.title = title
    self.implemented = implemented
  }

  static func == (lhs: Feature, rhs: Feature) -> Bool {
    return lhs.title == rhs.title && lhs.implemented == rhs.implemented
  }

  func hash(into hasher: inout Hasher) {
    hasher.combine(title)
    hasher.combine(implemented)
  }
}

enum FeatureList {
  public static let content = [
    Feature(title: Constants.About.featureOnboarding, implemented: true),
    Feature(
      title: Constants.About.featureProductsList, implemented: true
    ),
    Feature(title: Constants.About.featureProductDetails, implemented: true),
    Feature(title: Constants.About.featureShoppingCart, implemented: true)
  ]
}
