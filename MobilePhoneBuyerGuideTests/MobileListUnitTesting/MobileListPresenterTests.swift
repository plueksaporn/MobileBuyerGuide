//
//  MobileListPresenterTests.swift
//  MobilePhoneBuyerGuide
//
//  Created by Plueksaporn Kattiyawong on 4/9/2562 BE.
//  Copyright (c) 2562 SCB. All rights reserved.
//

@testable import MobilePhoneBuyerGuide
import XCTest

class MobileListPresenterTests: XCTestCase {

  // MARK: - Subject under test

  var sut: MobileListPresenter!

  // MARK: - Test lifecycle

  override func setUp() {
    super.setUp()
    setupMobileListPresenter()
  }

  override func tearDown() {
    super.tearDown()
  }

  // MARK: - Test setup

  func setupMobileListPresenter() {
    sut = MobileListPresenter()
  }

  // MARK: - Test doubles
  class MobileListViewControllerSpy: MobileListViewControllerInterface {
    func displayFavourite(index: IndexPath) {
      <#code#>
    }
    
    
    var displayMobileListCalled = false
    var setFavouriteCalled = false
    var sendMobileItemCalled = false
    var showAllMobileListCalled = false
    
    func displayMobileList(viewModel: Mobile.Mobile.ViewModel) {
      displayMobileListCalled = true
    }
    
    func setFavourite(index: IndexPath) {
      setFavouriteCalled = true
    }
    
    func sendMobileItem(viewModel: Mobile.SendItem.ViewModel) {
      sendMobileItemCalled = true
    }
    
    func showAllMobileList(viewModel: Mobile.ButtonStatus.ViewModel) {
      showAllMobileListCalled = true
    }
    
    
  }
  // MARK: - Tests

  func testSomething() {
    // Given

    // When

    // Then
  }
}
