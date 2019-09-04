//
//  MobileListEntity.swift
//  MobilePhoneBuyerGuide
//
//  Created by Plueksaporn Kattiyawong on 1/9/2562 BE.
//  Copyright (c) 2562 SCB. All rights reserved.
//

import Foundation

class MobileEntity : Codable {
    let rating:Double
    let id:Int
    let thumbImageURL:String
    let price:Double
    let brand:String
    let name:String
    let description:String
    var favouriteStatus:Bool?
}



