//
//  MobileListEntity.swift
//  MobilePhoneBuyerGuide
//
//  Created by Plueksaporn Kattiyawong on 1/9/2562 BE.
//  Copyright (c) 2562 SCB. All rights reserved.
//

import Foundation

struct MobileEntity: Codable {
    let rating: Double
    let id: Int
    let thumbImageURL: String
    let price: Double
    let brand: String
    let name: String
    let description: String
    var favouriteStatus: Bool?
}

extension MobileEntity: Equatable {
  static func == (lhs: MobileEntity, rhs: MobileEntity) -> Bool {
    return lhs.name == rhs.name &&
      lhs.brand == rhs.brand &&
      lhs.description == rhs.description &&
      lhs.id == rhs.id &&
      lhs.favouriteStatus == rhs.favouriteStatus &&
      lhs.rating == rhs.rating &&
      lhs.price == rhs.price &&
      lhs.thumbImageURL == rhs.thumbImageURL
    
  }
}

