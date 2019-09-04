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

  var sut: MobileDetailPresenter!

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
    sut = MobileDetailPresenter()
  }

  // MARK: - Test doubles

  // MARK: - Tests

  func testSomething() {
    // Given

    // When

    // Then
  }
}
