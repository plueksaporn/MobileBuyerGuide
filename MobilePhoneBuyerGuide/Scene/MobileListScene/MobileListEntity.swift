//
//  MobileListEntity.swift
//  MobilePhoneBuyerGuide
//
//  Created by Plueksaporn Kattiyawong on 1/9/2562 BE.
//  Copyright (c) 2562 SCB. All rights reserved.
//

import Foundation

/*

 The Entity class is the business object.
 The Result enumeration is the domain model.

 1. Rename this file to the desired name of the model.
 2. Rename the Entity class with the desired name of the model.
 3. Move this file to the Models folder.
 4. If the project already has a declaration of Result enumeration, you may remove the declaration from this file.
 5. Remove the following comments from this file.

 */

// The entity or business object
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



