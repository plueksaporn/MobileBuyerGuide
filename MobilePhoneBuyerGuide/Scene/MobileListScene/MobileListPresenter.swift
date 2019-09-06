//
//  MobileListPresenter.swift
//  MobilePhoneBuyerGuide
//
//  Created by Plueksaporn Kattiyawong on 1/9/2562 BE.
//  Copyright (c) 2562 SCB. All rights reserved.
//

import UIKit

protocol MobileListPresenterInterface {
  func presentMobileList(response: Mobile.Mobile.Response)
  func presentSendMobileItem(response: Mobile.SendItem.Response)
}

class MobileListPresenter: MobileListPresenterInterface {
 
  weak var viewController: MobileListViewControllerInterface!
  var displayMobileList: [Mobile.Mobile.ViewModel.DisplayMobileModel] = []
  
  func presentMobileList(response: Mobile.Mobile.Response) {
    for item in response.model {
      if item.favouriteStatus != nil {
        let displayMobileModel = Mobile.Mobile.ViewModel.DisplayMobileModel(
          id: item.id,
          rating: item.rating,
          thumbImageURL: item.thumbImageURL,
          price: item.price,
          name: item.name,
          description: item.description,
          favouriteStatus: item.favouriteStatus)
        displayMobileList.append(displayMobileModel)

      }else {
        let displayMobileModel = Mobile.Mobile.ViewModel.DisplayMobileModel(
            id: item.id,
            rating: item.rating,
            thumbImageURL: item.thumbImageURL,
            price: item.price,
            name: item.name,
            description: item.description,
            favouriteStatus: false)
        displayMobileList.append(displayMobileModel)

      }
    }
    
    let viewModel = Mobile.Mobile.ViewModel(displayMobileModels: displayMobileList)
    viewController.displayMobileList(viewModel: viewModel)
  }
  
  func presentSendMobileItem(response: Mobile.SendItem.Response) {
    let viewModel = Mobile.SendItem.ViewModel(item: response.item)
    viewController.sendMobileItem(viewModel: viewModel)
  }
  
}
