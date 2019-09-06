//
//  MobileDetailPresenterTests.swift
//  MobilePhoneBuyerGuide
//
//  Created by Plueksaporn Kattiyawong on 4/9/2562 BE.
//  Copyright (c) 2562 SCB. All rights reserved.
//

@testable import MobilePhoneBuyerGuide
import XCTest

class MobileDetailPresenterTests: XCTestCase {

  // MARK: - Subject under test

  var mobileDetailPresenter: MobileDetailPresenter!

  // MARK: - Test lifecycle

  override func setUp() {
    super.setUp()
    setupMobileDetailPresenter()
  }

  override func tearDown() {
    super.tearDown()
  }

  // MARK: - Test setup

  func setupMobileDetailPresenter() {
    mobileDetailPresenter = MobileDetailPresenter()
  }

  // MARK: - Test doubles
  class MobileDetailViewControllerSpy: MobileDetailViewControllerInterface {
    var displayMobileDetailCalled = false
    func displayMobileDetail(viewModel: MobileDetail.ShowDetail.ViewModel) {
      displayMobileDetailCalled = true
    }
  }
  // MARK: - Tests

  func testPresentMobileDetail() {
    // Given
    let mobileDetailViewControllerSpy = MobileDetailViewControllerSpy()
    mobileDetailPresenter.viewController = mobileDetailViewControllerSpy
    let imageData = MobileDetail.ShowDetail.Response(
      model: MobileTest.MobileData.imageList,
      rating: 4.0,
      price: 199.6,
      name: "Mobile name",
      description: "Description")
    
    // When
    let response = imageData
    mobileDetailPresenter.presentMobileDetail(response: response)

    // Then
    XCTAssert(mobileDetailViewControllerSpy.displayMobileDetailCalled)
    
    
  }
}
