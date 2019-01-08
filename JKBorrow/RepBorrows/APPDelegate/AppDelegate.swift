//
//  AppDelegate.swift
//  RepBorrows
//
//  Created by caoyong on 2018/11/1.
//  Copyright © 2018年 caoyong. All rights reserved.
//

import UIKit
//import ViewController

//类似于OC语言中的main.m文件中的代码、程序的主入口(如何我们需要自定义添加mian.swift入口时候、需要删除@UIApplicationMain)
//@UIApplicationMain的作用是将标注的类作为委托(将APPdDelegate作为委托)
//@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    //MARK:application will launch function
    func application(_ application: UIApplication, willFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        return true
    }
    //MARK:did finish launch funtion
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        //创建窗口对象
        self.window = UIWindow.init(frame:UIScreen.main.bounds)
        self.window?.backgroundColor = UIColor.white
        let rootvc = UIStoryboard.init(name: "Main", bundle: nil).instantiateInitialViewController()
        self.window?.rootViewController = rootvc
        self.window?.makeKeyAndVisible()
    
        return true
    }
    
    func applicationWillResignActive(_ application: UIApplication) {
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
    }

    func applicationWillTerminate(_ application: UIApplication) {
    }
}

