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

  var mobileListInteractor: MobileListInteractor!
  let mobileData = [MobileEntity(
    rating: 4.0,
    id: 1,
    thumbImageURL: "https://mobile1.jpg",
    price: 199.9,
    brand: "Some brand1",
    name: "Mobile name1",
    description: "Mobile discription1",
    favouriteStatus: nil)]
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
    mobileListInteractor = MobileListInteractor()
    
  }

  // MARK: - Test doubles
  class MobileListPresenterSpy: MobileListPresenterInterface {
    
     var presentMobileListCalled = false
     var presentAllMobileListCalled = false
     var presentSendMobileItemCalled = false
    func presentAllMobileList(response: Mobile.ButtonStatus.Response) {
      presentAllMobileListCalled = true
    }
    
    func presentSendMobileItem(response: Mobile.SendItem.Response) {
      presentSendMobileItemCalled = true
    }
    
    func presentMobileList(response: Mobile.Mobile.Response) {
      presentMobileListCalled = true
    }
  }
  // MARK: - Tests

  func testGetMobileData() {
    // Given
    
    // When
    
    // Then
  }
  //#SuccessCase
  func testSetFavouriteIsTrue(){
    // Given
    let mobileListPresenterSpy = MobileListPresenterSpy()
    mobileListInteractor.presenter = mobileListPresenterSpy
    let expectFavouriteStatus = true
    mobileListInteractor.model = mobileData
    // When
    let request = Mobile.FaouriteStatus.Request(indexPathCell: [0,0])
    mobileListInteractor.setFavourite(request: request)
    // Then
    XCTAssert(mobileListPresenterSpy.presentMobileListCalled)
    XCTAssertEqual(expectFavouriteStatus, mobileListInteractor.model[request.indexPathCell.row].favouriteStatus)
  }
  
  func testSetFavouriteIsFalse(){
    // Given
    let mobileListPresenterSpy = MobileListPresenterSpy()
    mobileListInteractor.presenter = mobileListPresenterSpy
    mobileListInteractor.model = [MobileEntity(
      rating: 4.0,
      id: 1,
      thumbImageURL: "https://mobile.jpg",
      price: 199.9,
      brand: "Some brand",
      name: "Mobile name",
      description: "Mobile discription",
      favouriteStatus: true)]
    let expectFavouriteStatus = false
    // When
    let request = Mobile.FaouriteStatus.Request(indexPathCell: [0,0])
    mobileListInteractor.setFavourite(request: request)
    // Then
    XCTAssert(mobileListPresenterSpy.presentMobileListCalled)
    XCTAssertEqual(expectFavouriteStatus, mobileListInteractor.model[request.indexPathCell.row].favouriteStatus)
  }
  
  func testGetFavouriteList(){
    //Given
    mobileListInteractor.model = [MobileEntity(
      rating: 4.9,
      id: 1,
      thumbImageURL: "https://mobile2.jpg",
      price: 20.9,
      brand: "Some brand2",
      name: "Mobile name2",
      description: "Description2",
      favouriteStatus: true),
      MobileEntity(
      rating: 4.0,
      id: 2,
      thumbImageURL: "https://mobile1.jpg",
      price: 199.9,
      brand: "Some brand1",
      name: "Mobile name1",
      description: "Mobile discription1",
      favouriteStatus: false)]
    let expectFavouriteCount = 1
    let mobileListPresenterSpy = MobileListPresenterSpy()
    mobileListInteractor.presenter = mobileListPresenterSpy
    //When
    let request = Mobile.ButtonStatus.Request(favouriteBtnIsSelected: true, allBtnIsSelected: false, deleteStatus: true)
    mobileListInteractor.getFavouriteList(request: request)
    //Then
    XCTAssertEqual(mobileListInteractor.favouriteList.count, expectFavouriteCount)
    XCTAssert(mobileListPresenterSpy.presentMobileListCalled)
  }
  
  func testGetAllList(){
    let mobileListPresenterSpy = MobileListPresenterSpy()
    mobileListInteractor.presenter = mobileListPresenterSpy
    let expectModel = [
      MobileEntity(
        rating: 4.9,
        id: 1,
        thumbImageURL: "https://mobile2.jpg",
        price: 20.9,
        brand: "Some brand2",
        name: "Mobile name2",
        description: "Description2",
        favouriteStatus: true
      )
    ]
    let allBtnIsSelected = true
    mobileListInteractor.mobileList = expectModel
    
    //When
    let request = Mobile.ButtonStatus.Request(favouriteBtnIsSelected: true, allBtnIsSelected: allBtnIsSelected, deleteStatus: true)
    mobileListInteractor.getFavouriteList(request: request)

    //Then
    XCTAssertEqual(mobileListInteractor.mobileList, expectModel)
    XCTAssert(mobileListPresenterSpy.presentMobileListCalled)
  }
  
  func testSendMobileDetail(){
    let mobileListPresenterSpy = MobileListPresenterSpy()
    mobileListInteractor.presenter = mobileListPresenterSpy
    let expectModel = [
      MobileEntity(
        rating: 4.9,
        id: 1,
        thumbImageURL: "https://mobile2.jpg",
        price: 20.9,
        brand: "Some brand2",
        name: "Mobile name2",
        description: "Description2",
        favouriteStatus: true
      )
    ]
    mobileListInteractor.model = expectModel
    //When
    let request = Mobile.SendItem.Request(indexPathCell: [0,0])
    mobileListInteractor.sendMobileDetail(request: request)
    
    //Then
    XCTAssertEqual([mobileListInteractor.item], expectModel)
    XCTAssert(mobileListPresenterSpy.presentSendMobileItemCalled)
  }
  
  func testDeleteFavouriteItem(){
    let mobileListPresenterSpy = MobileListPresenterSpy()
    mobileListInteractor.presenter = mobileListPresenterSpy
    let expectModel = [
      MobileEntity(
        rating: 4.9,
        id: 1,
        thumbImageURL: "https://mobile2.jpg",
        price: 20.9,
        brand: "Some brand2",
        name: "Mobile name2",
        description: "Description2",
        favouriteStatus: true
      )
    ]
    mobileListInteractor.mobileList = expectModel
    let indexPath = IndexPath(indexes: [0,0])
    //When
     let request = Mobile.FaouriteStatus.Request(indexPathCell: indexPath)
    mobileListInteractor.deleteFavouriteItem(request: request)
    
    //Then
    XCTAssertEqual(mobileListInteractor.model[indexPath.row].favouriteStatus, false)
    XCTAssert(mobileListPresenterSpy.presentMobileListCalled)
  }
  
  func testDoSorting(){
    // Given
    
    // When
    
    // Then
  }
}
