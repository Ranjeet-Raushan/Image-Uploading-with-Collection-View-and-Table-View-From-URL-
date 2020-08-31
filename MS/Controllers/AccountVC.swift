//  AccountVC.swift
//  MS
//  Created by Ranjeet Raushan on 15/08/20.
//  Copyright © 2020 Ranjeet Raushan. All rights reserved.

import UIKit

class AccountVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    override func viewWillAppear(_ animated: Bool) {
           super.viewWillAppear(animated)
           if (self.navigationController?.navigationBar) != nil {
               navigationController?.navigationBar.barTintColor = UIColor.green
               navigationController?.view.backgroundColor = UIColor.white 
           }
           self.navigationController?.navigationBar.topItem?.title = " "
           navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
             navigationItem.title = "Account"
       }
}
