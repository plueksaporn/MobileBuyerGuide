//
//  MobileListInteractor.swift
//  MobilePhoneBuyerGuide
//
//  Created by Plueksaporn Kattiyawong on 1/9/2562 BE.
//  Copyright (c) 2562 SCB. All rights reserved.
//

import UIKit

protocol MobileListInteractorInterface {
  func getMobileData(request: Mobile.Mobile.Request)
  func setFavourite(request: Mobile.FaouriteStatus.Request)
  func getFavouriteList(request: Mobile.ButtonStatus.Request)
  func deleteFavouriteItem(request: Mobile.FaouriteStatus.Request)
  func sendMobileDetail(request: Mobile.SendItem.Request)
  func doSorting(request: Mobile.Sorting.Request)
  var model: [MobileEntity] { get set }
  var item: MobileEntity? { get set }
}

class MobileListInteractor: MobileListInteractorInterface {
 
  var presenter: MobileListPresenterInterface!
  var worker: MobileListWorker?
  var model: [MobileEntity] = []
  var favouriteList: [MobileEntity] = []
  var mobileList: [MobileEntity] = []
  var item: MobileEntity?
  var displayMobileList: [MobileEntity] = []
  // MARK: - Business logic

  func getMobileData(request: Mobile.Mobile.Request) {
    worker?.getMobileList { [weak self] in
      if case let Result.success(data) = $0 {
        self?.model = data
        }
        guard let model = self?.model else {
            return
      }
      self?.mobileList = model
         let response = Mobile.Mobile.Response(model: model)
        self?.presenter.presentMobileList(response: response)
    }
  }
  
  func setFavourite(request: Mobile.FaouriteStatus.Request) {
    if model[request.indexPathCell.row].favouriteStatus == true {
      model[request.indexPathCell.row].favouriteStatus = false
      mobileList[request.indexPathCell.row].favouriteStatus = false
    }else{
      model[request.indexPathCell.row].favouriteStatus = true
      mobileList[request.indexPathCell.row].favouriteStatus = true
    }
    let response = Mobile.Mobile.Response(model: model)
    self.presenter.presentMobileList(response: response)
  }
  //bug
  func getFavouriteList(request: Mobile.ButtonStatus.Request) {
    let favouriteStatus = model.filter {
      $0.favouriteStatus ?? false
    }
      if request.favouriteBtnIsSelected == true {
          favouriteList = favouriteStatus
          model = favouriteList
      }
      if  request.allBtnIsSelected == true {
        model =  mobileList
      }
    
    let response = Mobile.Mobile.Response(model: model)
    self.presenter.presentMobileList(response: response)
  }

  func deleteFavouriteItem(request: Mobile.FaouriteStatus.Request) {
    mobileList[request.indexPathCell.row].favouriteStatus = false
    model = mobileList
    let response = Mobile.Mobile.Response(model: model)
    self.presenter.presentMobileList(response: response)
  }
  
  func sendMobileDetail(request: Mobile.SendItem.Request) {
    item = model[request.indexPathCell.row]
    guard let item = item else {
      return
    }
    let response = Mobile.SendItem.Response(item: item)
    self.presenter.presentSendMobileItem(response: response)
  }
  
  func doSorting(request: Mobile.Sorting.Request) {
    model.sort { (lhs: MobileEntity, rhs: MobileEntity) -> Bool in
      if request.type == "low" {
        return lhs.price < rhs.price
      }else if request.type == "high" {
        return lhs.price > rhs.price
      }else {
        return lhs.rating > rhs.rating
      }
    }
    let response = Mobile.Mobile.Response(model: model)
    self.presenter.presentMobileList(response: response)
  }
}
