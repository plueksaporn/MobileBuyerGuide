//
//  MobileListInteractorTests.swift
//  MobilePhoneBuyerGuide
//
//  Created by Plueksaporn Kattiyawong on 4/9/2562 BE.
//  Copyright (c) 2562 SCB. All rights reserved.
//

@testable import MobilePhoneBuyerGuide
import XCTest

class MobileListInteractorTests: XCTestCase {

  // MARK: - Subject under test

  var mobileList: MobileListInteractor!

  // MARK: - Test lifecycle

  override func setUp() {
    super.setUp()
    setupMobileListInteractor()
  }

  override func tearDown() {
    super.tearDown()
  }

  // MARK: - Test setup

  func setupMobileListInteractor() {
    mobileList = MobileListInteractor()
  }

  // MARK: - Test doubles

  // MARK: - Tests

  func testGetMobileData() {
    // Given
//    let data: [String] = ["MobileData"]
    // When
    
    // Then
  }
  
  func testSetFavourite(){
    // Given
    let req = Mobile.SendItem.Request(indexPathCell: [0,0])
    let favouriteStatus: Bool = false
    // When
//    mobileList.setFavourite(request: req)
    // Then
  }
}
