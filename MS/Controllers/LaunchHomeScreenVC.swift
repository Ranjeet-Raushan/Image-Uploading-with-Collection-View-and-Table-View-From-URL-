//  LaunchHomeScreenVC.swift
//  MS
//  Created by Ranjeet Raushan on 15/08/20.
//  Copyright © 2020 Ranjeet Raushan. All rights reserved.

import UIKit

class LaunchHomeScreenVC: UIViewController {

    @IBOutlet weak var launchHomePageBtn: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    //Mark:- Launch Home Page
    @IBAction func onLaunchHomePageButtonClk(_ sender: UIButton) {
        let vc = launchHomePage(index: 0)
                      if #available(iOS 13.0, *) {
                      guard let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene,
                          let sceneDelegate = windowScene.delegate as? SceneDelegate else {return}
                      sceneDelegate.window?.rootViewController = vc
                      sceneDelegate.window?.makeKeyAndVisible()
                  } else {
                      let window = (UIApplication.shared.delegate as! AppDelegate).window
                      window?.rootViewController = vc
                      window?.makeKeyAndVisible()
                  }
    }
    //Mark:- Tab Bar Related Code 
    //Mark:- Launch Home Page
    func launchHomePage(index: NSInteger) -> UITabBarController {
        let tabBar = UITabBarController()

        // Mark:- Home Page
        let story = UIStoryboard(name: "Main", bundle:nil)
        let tabOneBarItem0 = UITabBarItem(title: "Home", image:UIImage(named: "home")?.withRenderingMode(.alwaysOriginal), selectedImage: UIImage(named: "home_selected")?.withRenderingMode(.alwaysOriginal))
        let navtab = story.instantiateViewController(withIdentifier: "homeNav") as! HomeNavigationController
               let home = navtab.topViewController  as! HomeVC
               home.tabBarItem = tabOneBarItem0

        // Mark:- Orders Page
               let OrdersVC = story.instantiateViewController(withIdentifier: "OrdersVC") as! OrdersVC
               let tabOneBarItem1 = UITabBarItem(title: "Orders", image:UIImage(named: "order")?.withRenderingMode(.alwaysOriginal), selectedImage: UIImage(named: "order_selected")?.withRenderingMode(.alwaysOriginal))
               OrdersVC.tabBarItem = tabOneBarItem1
               let navtab1 = UINavigationController.init(rootViewController: OrdersVC)

        // Mark:- Chat Page
        let ChatVC = story.instantiateViewController(withIdentifier: "ChatVC") as! ChatVC
        let tabOneBarItem2 = UITabBarItem(title: "Chat", image:UIImage(named: "chat")?.withRenderingMode(.alwaysOriginal), selectedImage: UIImage(named: "chat-active")?.withRenderingMode(.alwaysOriginal))
        ChatVC.tabBarItem = tabOneBarItem2
        let navtab2 = UINavigationController.init(rootViewController: ChatVC)
        
        // Mark:- Inbox Page
        let InboxVC = story.instantiateViewController(withIdentifier: "InboxVC") as! InboxVC
        let tabOneBarItem3 = UITabBarItem(title: "Inbox", image:UIImage(named: "inbox")?.withRenderingMode(.alwaysOriginal), selectedImage: UIImage(named: "inbox-filled")?.withRenderingMode(.alwaysOriginal))
        InboxVC.tabBarItem = tabOneBarItem3
        let navtab3 = UINavigationController.init(rootViewController: InboxVC)
        
        // Mark:- Account Page
        let AccountVC = story.instantiateViewController(withIdentifier: "AccountVC") as! AccountVC
        let tabOneBarItem4 = UITabBarItem(title: "Account", image:UIImage(named: "account")?.withRenderingMode(.alwaysOriginal), selectedImage: UIImage(named: "account_selected")?.withRenderingMode(.alwaysOriginal))
        AccountVC.tabBarItem = tabOneBarItem4
        let navtab4 = UINavigationController.init(rootViewController: AccountVC)


        tabBar.viewControllers = [navtab ,navtab1, navtab2,navtab3,navtab4]

        UITabBarItem.appearance().setTitleTextAttributes([NSAttributedString.Key.font: UIFont.systemFont(ofSize: 12)], for: .normal)
        UITabBarItem.appearance().setTitleTextAttributes([NSAttributedString.Key.font: UIFont.systemFont(ofSize: 12)], for: .selected)
        UITabBar.appearance().barTintColor = UIColor.white
        UITabBar.appearance().tintColor = UIColor.blue
        tabBar.selectedIndex = index
        return tabBar
    }
}
