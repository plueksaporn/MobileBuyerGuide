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
  let model = [
    MobileEntity(
      rating: 4.9,
      id: 1,
      thumbImageURL: "https://mobile2.jpg",
      price: 20.9,
      brand: "Some brand2",
      name: "Mobile name2",
      description: "Description2",
      favouriteStatus: true
    ),
    MobileEntity(
      rating: 4.9,
      id: 2,
      thumbImageURL: "https://mobile2.jpg",
      price: 20.9,
      brand: "Some brand2",
      name: "Mobile name2",
      description: "Description2",
      favouriteStatus: nil
    )
  ]
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

  func testPresentMobileList() {
    // Given
    let expectModel = [
      Mobile.Mobile.ViewModel.DisplayMobileModel(
        id: 1,
        rating: 4.9,
        thumbImageURL: "https://mobile2.jpg",
        price: 20.9,
        name: "Mobile name2",
        description: "Description2",
        favouriteStatus: true),
      Mobile.Mobile.ViewModel.DisplayMobileModel(
        id: 2,
        rating: 4.9,
        thumbImageURL: "https://mobile2.jpg",
        price: 20.9,
        name: "Mobile name2",
        description: "Description2",
        favouriteStatus: false
      )
    ]
    let mobileListViewControllerSpy = MobileListViewControllerSpy()
    sut.viewController = mobileListViewControllerSpy
    // When
    let response = Mobile.Mobile.Response(model: model)
    sut.presentMobileList(response: response)
    
    // Then
    XCTAssertEqual(sut.displayMobileList, expectModel)
    XCTAssert(mobileListViewControllerSpy.displayMobileListCalled)
  }
  
  func testPresentSendMobileItem(){
    let mobileListViewControllerSpy = MobileListViewControllerSpy()
    sut.viewController = mobileListViewControllerSpy
    let model = MobileEntity(
      rating: 4.9,
      id: 1,
      thumbImageURL: "https://mobile2.jpg",
      price: 20.9,
      brand: "Some brand2",
      name: "Mobile name2",
      description: "Description2",
      favouriteStatus: true)
    //When
    let response = Mobile.SendItem.Response(item: model)
    sut.presentSendMobileItem(response: response)
    
    //Then
    XCTAssert(mobileListViewControllerSpy.sendMobileItemCalled)
  }
}
