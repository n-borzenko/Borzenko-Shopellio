//
//  Constants.swift
//  BorzenkoShopellio
//
//  Created by Natalia Borzenko on 19/02/2023.
//

import Foundation

enum Constants {
  enum General {
    static let headlineTextLineSpacing = 6.0
    static let unavailableString = "n/a"
  }

  enum Network {
    static let baseURLString = "https://shopellio.nborzenko.me/api/"
    static let shopEndpoint = "shop"
    static let productsEndpoint = "products"

    static let invalidURLText = "Failed to create the request the server"
    static let connectionErrorText = "Failed to establish connection to the server"
    static let failedRequestText = "Failed to query the server"
    static let invalidResponseText = "Failed to parse the response"
    static let serverErrorText = "Server error occurred"
    static let notFoundText = "Requested data was not found"
    static let failedDecodingText = "Failed to parse the response"

    static let networkMonitorQueue = "Shopellio.Monitor"
  }

  enum Cache {
    static let shopFilePath = "ShopData"
    static let productsFilePath = "ProductsData"
    static let cartItemsFilePath = "CartItemsData"
    static let fileExtension = "json"
  }

  enum Main {
    static let productsTitle = "Products"
    static let newArrivalsTitle = "New Arrivals"
    static let cartTitle = "Cart"
    static let aboutTitle = "About"

    static let mainAnimationDuration = 0.5
    static let onboardingWasShownKey = "OnboardingWasShown"
  }

  enum Identifiers {
    static let productDetailsTitle = "Product details title"
    static let itemsCount = "Items count"
    static let beforeDiscount = "Before discount"
    static let discountedAmount = "Discounted amount"
    static let totalAmount = "Total amount"
  }

  enum ProductGroups {
    static let navigationTitle = "Products"

    static let newGroupKey = "new"
    static let saleGroupKey = "sale"
    static let womenGroupKey = "women"
    static let menGroupKey = "men"

    static let collectionsTitle = "Collections"
    static let categoriesTitle = "Categories"
    static let subcategoriesLabel = "subcategories"
    static let subcategoryLabel = "subcategory"

    static let cellMinHeight = 160.0
    static let titleBottomPadding = 2.0
    static let cellCornerRadius = 16.0
    static let columnMinWidth = 150.0
    static let imageWidthScale = 1.5
    static let imageOffsetScale = 0.1
  }

  enum ProductsGrid {
    static let categoryPickerLabel = "Category"
    static let subcategoryPickerLabel = "Subcategory"
    static let allSubcategoriesLabel = "All subcategories"
    static let allPickerLabel = "All"

    static let gridItemMaxWidth = 220.0
    static let gridItemMinWidth = 160.0
    static let cellAspectRatio = CGSize(width: 3, height: 5)
    static let cellPadding = 8.0
    static let cellCornerRadius = 16.0
    static let titleRowLineLimit = 2
    static let scrollTimeout = 300
  }

  enum Product {
    static let imagePlaceholderScale = 0.2

    static let colorCircleSmallSize = 16.0
    static let colorCircleLargeSize = 32.0
    static let colorCircleBorderWidth = 1.0
    static let colorCircleLimit = 5
    static let colorCircleSmallLineWidth = 3.0
    static let colorCircleLargeLineWidth = 5.0
    static let colorCircleGradientStops = [ 0.46, 0.48, 0.52, 0.54 ]

    static let newArrivalTag = "new"
    static let tagCornerRadius = 4.0
    static let tagHorizontalPadding = 4.0

    static let sizeLabelSmallCornerRadius = 4.0
    static let sizeLabelLargeCornerRadius = 8.0
    static let sizeLabelSmallHorizontalPadding = 4.0
    static let sizeLabelSmallVerticalPadding = 0.0
    static let sizeLabelLargeHorizontalPadding = 12.0
    static let sizeLabelLargeVerticalPadding = 6.0
    static let sizeLabelUnavailableOpacity = 0.5
    static let sizeLabelDefaultOpacity = 1.0
    static let sizeLabelBorderWidth = 1.0

    static let closeButtonTitle = "Close"
  }

  enum ProductDetails {
    static let colorsListLabel = "Colors:"
    static let sizesListLabel = "Sizes:"
    static let selectionBorderWidth = 2.0

    static let selectColorLabel = "Select color:"
    static let colorLabel = "Color:"
    static let colorStackSpacing = 12.0
    static let colorSelectionWidth = 44.0

    static let sizeTitle = "Size"
    static let selectSizeLabel = "Select size:"
    static let sizeLabel = "Size:"
    static let sizeCornerRadiusOffset = 2.0
    static let sizesGridSpacing = 10.0
    static let sizesMinColumnWidth = 70.0

    static let addToCartButtonTitle = "Add to cart"

    static let minWidthForVerticalGallery = 800.0
    static let imageWidthScale = 2.5
    static let imageHeightScale = 1.5

    static let ratingSpacing = 2.0
    static let reviewsSpacing = 12.0
    static let reviewSpacing = 4.0

    static let reviewsListLabel = "Reviews:"
    static let emptyReviewList = "No reviews are available"
    static let emptyReviewMessage = "Review message is unavailable"
    static let emptyReviewMessageOpacity = 0.5
  }

  enum Cart {
    static let titleRowLineLimit = 2

    static let navigationTitle = "Cart"
    static let checkoutButtonTitle = "Checkout"
    static let contentSectionTitle = "Content"
    static let summarySectionTitle = "Summary"
    static let summaryItemsCount = "Items count:"
    static let summaryBeforeDiscount = "Before discount:"
    static let summaryDiscountedAmount = "Discounted amount:"
    static let summaryTotalAmount = "Total amount:"
    static let rowColorLabel = "Color:"
    static let rowSizeLabel = "Size:"
    static let rowCountLabel = "Count:"
    static let emptyCartButtonTitle = "Go shopping"

    static let removeAllButtonTitle = "Remove all"
    static let removeAllAlertTitle = "Empty the cart"
    static let cancelButtonTitle = "Cancel"
    static let removeAllAlertMessage = "Are you sure you want to empty the cart?"
  }

  enum LoadingView {
    static let startAngle = 0.0
    static let endAngle = 360.0
    static let largeRadius = 32.0
    static let smallRadius = 18.0
    static let largeMaxSize = 14.0
    static let smallMaxSize = 6.0
    static let largeIndexScale = 2.0
    static let smallIndexScale = 1.0
    static let dotsCount = 6
    static let animationDuration = 1.5
  }

  enum ErrorStateView {
    static let requestErrorImage = "ConnectionError"
    static let emptyCartImage = "EmptyCart"
    static let emptyProductGroupImage = "EmptyGroup"
    static let requestErrorMessage = "There was an error while processing the request. " +
    "Please, check the connection and try again"
    static let emptyCartMessage = "Your cart is empty. Please, explore our products catalogue"
    static let emptyProductGroupMessage = "Unfortunately, there are no items in this group of products"

    static let requestErrorActionTitle = "Try again"
    static let networkOnlineTitle = "Network connection is stable"
    static let networkOfflineTitle = "Network connection seems to be offline"

    static let minSpacerLength = 0.0
    static let loadingAspectRatio = 1.0
    static let imageMaxWidth = 300.0
    static let imageHorizontalPadding = 50.0
    static let verticalStackSpacing = 20.0
    static let verticalStackTopPadding = 40.0
    static let errorMessageMaxWidth = 500.0
    static let networkStatusOpacity = 0.8
  }

  enum OnboardingView {
    static let page1Image = "OnboardingPage1"
    static let page2Image = "OnboardingPage2"
    static let page3Image = "OnboardingPage3"

    static let page1Title = "Discover the full catalog"
    static let page2Title = "Check out our hot deals"
    static let page3Title = "Easy to order whatever you like"

    static let page1Subtitle = "Explore perfectly organized categories"
    static let page2Subtitle = "Buy our new items first or save on regular sales"
    static let page3Subtitle = "Save items to cart and buy later"

    static let startButtonTitle = "Start"
    static let skipButtonTitle = "Skip"
    static let nextButtonTitle = "Next"

    static let imageMaxWidth = 300.0
    static let textMaxWidth = 500.0
    static let pageIndicatorOpacity = 0.2
  }

  enum About {
    static let navigationTitle = "About"
    static let verticalSpacing = 20.0
    static let featureListSpacing = 10.0

    static let headlineText = "Shopellio is an online shop " +
    "where you can buy a huge variety of different products that can fit anyone's needs. " +
    "User-friendly interface will help you navigate easily and choose the best item possible in almost one touch. " +
    "Please, enjoy the application and share your experience and thoughts!"
    static let productImagesDescription = "Images for products are selected from:"
    static let productImagesSourceTitle = "Unsplash"
    static let productImagesSourceUrl = "https://unsplash.com/license"
    static let illustrationsDescription = "Some images for products and " +
    "illustrations for empty and error screens are generated by:"
    static let illustrationsSourceTitle = "Midjourney"
    static let illustrationsSourceUrl = "https://docs.midjourney.com/docs/terms-of-service"
    static let footnoteText = "This app is the Capstone project for Kodeco iOS Bootcamp 2023."

    static let listTitle = "Feature list"
    static let featureOnboarding = "Onboarding screen"
    static let featureProductsList = "List of available products fetched from the API"
    static let featureProductDetails = "Detailed product page"
    static let featureShoppingCart = "Shopping cart"
  }
}
