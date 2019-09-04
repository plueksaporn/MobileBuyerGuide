//
//  MobileDetailModels.swift
//  MobilePhoneBuyerGuide
//
//  Created by Plueksaporn Kattiyawong on 3/9/2562 BE.
//  Copyright (c) 2562 SCB. All rights reserved.
//

import UIKit

struct MobileDetail {
  
  struct ShowDetail {
    struct Request {
       var itemList: MobileEntity?
    }
   
    struct Response {
      let model: [ImageEntity]
      let rating:Double
      let price:Double
      let name:String
      let description:String
      
    }
   
    struct ViewModel {
      let model: [ImageEntity]
      let rating:String
      let price:String
      let name:String
      let description:String

    }
  }
}
