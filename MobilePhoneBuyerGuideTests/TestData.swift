//
//  TestData.swift
//  MobilePhoneBuyerGuideTests
//
//  Created by Plueksaporn Kattiyawong on 6/9/2562 BE.
//  Copyright © 2562 SCB. All rights reserved.
//

@testable import MobilePhoneBuyerGuide
import XCTest

struct MobileTest
{
  struct MobileData
  {
    static let imageList = [
      ImageEntity(
      id: 1,
        url: "https://url.com",
        mobileID: 4),
      ImageEntity(
        id: 2,
        url: "https://url2.com",
        mobileID: 5)
    ]
    static let mobileItem = MobileEntity(
      rating: 4.0,
      id: 1,
      thumbImageURL: "https://mobile1.jpg",
      price: 199.9,
      brand: "Some brand1",
      name: "Mobile name1",
      description: "Mobile discription1",
      favouriteStatus: nil)
   }
  
  struct MobileExpectData {
    static let presentDetail = MobileDetail.ShowDetail.ViewModel(
      model: MobileTest.MobileData.imageList,
      rating: "Rating: 4.0",
      price: "Price: $199.6",
      name: "Mobile name",
      description: "Description")
  }
}

