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

  // MARK: - Tests

  func testSomething() {
    // Given

    // When

    // Then
  }
}
