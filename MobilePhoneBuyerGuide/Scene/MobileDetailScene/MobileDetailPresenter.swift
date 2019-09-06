//
//  MobileDetailPresenter.swift
//  MobilePhoneBuyerGuide
//
//  Created by Plueksaporn Kattiyawong on 3/9/2562 BE.
//  Copyright (c) 2562 SCB. All rights reserved.
//

import UIKit

protocol MobileDetailPresenterInterface {
  func presentMobileDetail(response: MobileDetail.ShowDetail.Response)
}

class MobileDetailPresenter: MobileDetailPresenterInterface {
  weak var viewController: MobileDetailViewControllerInterface!
  var viewModel: MobileDetail.ShowDetail.ViewModel?
  func presentMobileDetail(response: MobileDetail.ShowDetail.Response) {
      viewModel = MobileDetail.ShowDetail.ViewModel(
      model: response.model,
      rating: "Rating: \(String(response.rating))",
      price: "Price: $\(String(response.price))",
      name: response.name,
      description: response.description)
    guard let viewModel = viewModel else {
      return
    }
    viewController.displayMobileDetail(viewModel: viewModel)
  }
}
