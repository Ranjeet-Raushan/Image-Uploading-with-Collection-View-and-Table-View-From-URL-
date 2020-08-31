//  TabBarVC.swift
//  MS
//  Created by Ranjeet Raushan on 15/08/20.
//  Copyright © 2020 Ranjeet Raushan. All rights reserved.

import UIKit

import UIKit

var tabBarController: UITabBarController?
class TabBarVC: NSObject
{
    func sharedClass() -> UITabBarController{
        if tabBarController == nil {
            tabBarController = UITabBarController()
            return tabBarController!
        }
        return tabBarController!
    }
}

