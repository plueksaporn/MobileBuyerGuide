//
//  MobileListModels.swift
//  MobilePhoneBuyerGuide
//
//  Created by Plueksaporn Kattiyawong on 1/9/2562 BE.
//  Copyright (c) 2562 SCB. All rights reserved.
//

import Foundation

struct Mobile {

  struct Mobile {

    struct Request {
      
    }
    struct Response {
        let model: [MobileEntity]
    }
    
    struct ViewModel {
        var displayMobileModels: [DisplayMobileModel]
        
        struct DisplayMobileModel {
            let id: Int
            let rating: Double
            let thumbImageURL: String
            let price: Double
            let name: String
            let description: String
            var favouriteStatus: Bool?
        }
    }
  }
  
  struct FaouriteStatus {
    struct Request {
      let indexPathCell: IndexPath
    }

    struct Response {
      let model: [MobileEntity]
    }
    struct ViewModel {
      
    }
  }
  
  struct ButtonStatus {
    struct Request {
      var favouriteBtnIsSelected: Bool
      var allBtnIsSelected: Bool
      let deleteStatus: Bool
    }
    
    struct Response {
      let model: [MobileEntity]
      var favouriteBtnIsSelected: Bool
      var allBtnIsSelected: Bool
      let repeateBtn: Bool
    }
    
    struct ViewModel {
      let model: [MobileEntity]
      var favouriteBtnIsSelected: Bool
      var allBtnIsSelected: Bool
      let repeateBtn: Bool
    }
  }
  
  struct SendItem {
    
    struct Request {
       let indexPathCell: IndexPath
    }
    
    struct Response {
      let item: MobileEntity
    }
    
    struct ViewModel {
      let item: MobileEntity
    }
  }
struct Sorting {
  struct Request {
    var type: String
  }
  struct Response {
  }
  struct ViewModel {
  }
}

}
extension Mobile.Mobile.ViewModel.DisplayMobileModel: Equatable {
  static func == (lhs: Mobile.Mobile.ViewModel.DisplayMobileModel, rhs: Mobile.Mobile.ViewModel.DisplayMobileModel) -> Bool {
    return lhs.name == rhs.name &&
      lhs.description == rhs.description &&
      lhs.id == rhs.id &&
      lhs.favouriteStatus == rhs.favouriteStatus &&
      lhs.rating == rhs.rating &&
      lhs.price == rhs.price &&
      lhs.thumbImageURL == rhs.thumbImageURL
  }
}
