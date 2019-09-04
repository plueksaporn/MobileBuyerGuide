//
//  MobileDetailWorker.swift
//  MobilePhoneBuyerGuide
//
//  Created by Plueksaporn Kattiyawong on 1/9/2562 BE.
//  Copyright (c) 2562 SCB. All rights reserved.
//

import UIKit

protocol MobileDetailStoreProtocol {
  func getData(_ completion: @escaping (Result<Entity>) -> Void)
}

class MobileDetailWorker {

  var store: MobileDetailStoreProtocol

  init(store: MobileDetailStoreProtocol) {
    self.store = store
  }

  // MARK: - Business Logic

  func doSomeWork(_ completion: @escaping (Result<Entity>) -> Void) {
    // NOTE: Do the work
    store.getData {
      // The worker may perform some small business logic before returning the result to the Interactor
      completion($0)
    }
  }
}
