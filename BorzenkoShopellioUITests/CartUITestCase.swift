//
//  CartUITestCase.swift
//  BorzenkoShopellioUITests
//
//  Created by Natalia Borzenko on 26/03/2023.
//

// swiftlint:disable overridden_super_call function_body_length

import XCTest

final class CartUITestCase: XCTestCase {
  override func setUpWithError() throws {
    continueAfterFailure = false
  }

  func selectVariant(color: String, size: String) {
    let app = XCUIApplication()
    let scrollViews = app.scrollViews
    app.navigationBars.buttons["Add to cart"].tap()
    scrollViews.buttons[color].tap()
    scrollViews.buttons[size].tap()
    scrollViews.buttons["Add to cart"].tap()
    if !app.tabBars["Tab Bar"].waitForExistence(timeout: 2) {
      XCTFail("Select variant sheet should have disappeared in 2 seconds, but it didn't")
    }
  }

  func compareCellText(staticTexts: XCUIElementQuery, id: String, isVisible: Bool = true, text expectedLabel: String = "") {
    XCTAssertEqual(
      staticTexts["\(id):"].exists,
      isVisible,
      "\(id) cell should \(isVisible ? "" : "not ")be visible, but it is\(isVisible ? "n't" : "")"
    )
    if isVisible {
      let label = staticTexts[id].label
      XCTAssertEqual(
        label,
        expectedLabel,
        "\(id) label should be equal to \"\(expectedLabel)\", but it is \(label)"
      )
    }
  }

  func checkCartSummary(quantity: Int = 0, total: String = "", beforeDiscount: String = "", discounted: String = "") {
    let staticTexts = XCUIApplication().collectionViews.cells.staticTexts
    compareCellText(staticTexts: staticTexts, id: "Items count", text: "\(quantity)")
    if !beforeDiscount.isEmpty && !discounted.isEmpty {
      compareCellText(staticTexts: staticTexts, id: "Before discount", text: "$\(beforeDiscount)")
      compareCellText(staticTexts: staticTexts, id: "Discounted amount", text: "$\(discounted)")
    } else {
      compareCellText(staticTexts: staticTexts, id: "Before discount", isVisible: false)
      compareCellText(staticTexts: staticTexts, id: "Discounted amount", isVisible: false)
    }
    compareCellText(staticTexts: staticTexts, id: "Total amount", text: "$\(total)")
  }

  // MARK: - Cart screen actions and summary labels
  func testCartActions() throws {
    let app = XCUIApplication()
    app.launch()
    let tabBar = app.tabBars["Tab Bar"]

    // set up the environment
    UITestHelpers.skipOnboarding()
    try UITestHelpers.emptyTheCart()

    // add 3 items to the cart
    app.scrollViews.otherElements.buttons["Women, 6 subcategories"].tap()
    let scrollViews = app.scrollViews

    let trenchItem = scrollViews.buttons["Basic trench coat with belt, $129.00, NEW"]
    if !trenchItem.waitForExistence(timeout: 3) {
      XCTFail("Failed to load items in 3 seconds")
      return
    }
    trenchItem.tap()
    selectVariant(color: "beige", size: "M")
    selectVariant(color: "black", size: "M")

    if app.navigationBars.buttons["Women"].exists {
      app.navigationBars.buttons["Women"].tap()
    }

    scrollViews.buttons["Faux leather oversize jacket, $95.00, $90.25"].tap()
    scrollViews.staticTexts["Product details title"].swipeUp()
    selectVariant(color: "black", size: "L")

    // cart summary and tab badge
    try UITestHelpers.checkCartBadge(quantity: 3)
    tabBar.buttons["Cart"].tap()

    let collectionViews = app.collectionViews
    let itemsCountItem = collectionViews.cells.staticTexts["Items count"]
    let firstItem = collectionViews.cells.buttons.element(boundBy: 0)
    let secondItem = collectionViews.cells.buttons.element(boundBy: 1)
    checkCartSummary(quantity: 3, total: "348.25", beforeDiscount: "353.00", discounted: "4.75")

    firstItem.accessibilityScroll(.down)

    // first cart item label
    let firstItemLabel = "Basic trench coat with belt, $129.00, Beige, M, Size, "
    XCTAssertEqual(
      firstItem.label,
      "\(firstItemLabel)1",
      "First item label should be equal to \(firstItemLabel)1, but it is \(firstItem.label)"
    )

    collectionViews.firstMatch.swipeUp()
    // first cart item quantity should change
    firstItem.swipeRight()
    let addButton = collectionViews.buttons["Add"]
    XCTAssertTrue(addButton.exists, "Swipe right should have opened Add button, but it didn't")
    addButton.tap()
    XCTAssertEqual(
      firstItem.label,
      "\(firstItemLabel)2",
      "First item label should be equal to \(firstItemLabel)2, but it is \(firstItem.label)"
    )

    // cart summary and tab badge
    try UITestHelpers.checkCartBadge(quantity: 4)
    while !itemsCountItem.isHittable {
      collectionViews.firstMatch.swipeDown()
    }
    checkCartSummary(quantity: 4, total: "477.25", beforeDiscount: "482.00", discounted: "4.75")
    while !secondItem.isHittable {
      collectionViews.firstMatch.swipeUp()
    }

    // second cart item label
    var secondItemLabel = "Basic trench coat with belt, $129.00, Black, M, Size, "
    XCTAssertEqual(
      secondItem.label,
      "\(secondItemLabel)1",
      "Second item label should be equal to \(secondItemLabel)1, but it is \(secondItem.label)"
    )

    // second item should be removed
    secondItem.swipeRight()
    let removeButton = collectionViews.buttons["Remove"]
    XCTAssertTrue(removeButton.exists, "Swipe right should have opened Remove button, but it didn't")
    removeButton.tap()
    XCTAssertFalse(
      secondItem.label.starts(with: secondItemLabel),
      "Second item should have been removed, but it didn't"
    )

    // cart summary and tab badge
    try UITestHelpers.checkCartBadge(quantity: 3)
    while !itemsCountItem.isHittable {
      collectionViews.firstMatch.swipeDown()
    }
    checkCartSummary(quantity: 3, total: "348.25", beforeDiscount: "353.00", discounted: "4.75")
    while !secondItem.isHittable {
      collectionViews.firstMatch.swipeUp()
    }

    // third item label
    secondItemLabel = "Faux leather oversize jacket, $95.00, $90.25, Black, L, Size, "
    XCTAssertEqual(
      secondItem.label,
      "\(secondItemLabel)1",
      "Second item label should be equal to \(secondItemLabel)1, but it is \(secondItem.label)"
    )

    // second item should be deleted
    secondItem.swipeLeft()
    let deleteButton = collectionViews.buttons["Delete"]
    XCTAssertTrue(deleteButton.exists, "Swipe left should have opened Delete button, but it didn't")
    deleteButton.tap()
    sleep(2)
    XCTAssertFalse(secondItem.exists, "Initially third item should have been removed, but it didn't")

    // cart summary and tab badge
    try UITestHelpers.checkCartBadge(quantity: 2)
    checkCartSummary(quantity: 2, total: "258.00")

    // remove last item
    firstItem.swipeLeft()
    deleteButton.tap()

    // cart summary and tab badge
    try UITestHelpers.checkCartBadge(quantity: 0)

    // empty state for cart screen
    let elements = app.scrollViews.otherElements
    XCTAssertTrue(
      elements.staticTexts["Your cart is empty. Please, explore our products catalogue"].exists,
      "Empty state message should be visible, but it isn't"
    )
    XCTAssertTrue(
      elements.buttons["Go shopping"].isHittable,
      "Go shopping should be hittable, but it isn't"
    )

    // routing to products
    elements.buttons["Go shopping"].tap()
    XCTAssertTrue(
      tabBar.buttons["Products"].isSelected,
      "Products tab should be selected, but it isn't"
    )
  }
}
