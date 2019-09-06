//
//  MobileDetailInteractorTests.swift
//  MobilePhoneBuyerGuide
//
//  Created by Plueksaporn Kattiyawong on 4/9/2562 BE.
//  Copyright (c) 2562 SCB. All rights reserved.
//

@testable import MobilePhoneBuyerGuide
import XCTest

class MobileDetailInteractorTests: XCTestCase {

  // MARK: - Subject under test

  var sutMobileDetail: MobileDetailInteractor!
 

  // MARK: - Test lifecycle

  override func setUp() {
    super.setUp()
    setupMobileDetailInteractor()
  }

  override func tearDown() {
    super.tearDown()
  }


  func setupMobileDetailInteractor() {
    sutMobileDetail = MobileDetailInteractor()
  }

  class MobileDetailPresenterSpy: MobileDetailPresenterInterface {
    var presentMobileDetail = false
    func presentMobileDetail(response: MobileDetail.ShowDetail.Response) {
      presentMobileDetail = true
    }
  }
  
  class MobileDeatilWokerSpy: MobileDetailStoreProtocol {
    func getData(mobileItem: MobileEntity, _ completion: @escaping (Result<[ImageEntity], Error>) -> Void) {
//      completion([imageList])
      
    }
    
    
  }
  // MARK: - Tests

  func testGetImageData() {
    // Given
    let mobileDetailPresenterSpy = MobileDetailPresenterSpy()
    sutMobileDetail.presenter = mobileDetailPresenterSpy
    // When
    
    // Then
  }
  
  
}
