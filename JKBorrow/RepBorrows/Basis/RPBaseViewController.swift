//
//  RPBaseViewController.swift
//  RepBorrows
//
//  Created by caoyong on 2018/11/11.
//  Copyright © 2018 caoyong. All rights reserved.
//

import UIKit
//MARK:swift项目中需要自己创建的swift文件时候 直接使用 不需要倒入头文件
//MARK:swift项目中使用cocoapods倒入的第三方库时候、需要倒入头文件(一般是创建一个继承自NSObject对象的类)

class RPBaseViewController: UIViewController, FullPopGestureRecognize{
   
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor.clear
        
    }
    
    //MARK:协议方法
    func isAllowPopGestureShouldBegin(gestureRecognize: UIGestureRecognizer) -> Bool {
        return true
    }
}

/*
class myName: FullPopGestureRecognize {
    func clean() {}
}
class myName: NSObject, FullPopGestureRecognize {
     func clean() {}
}
*/

//MARK:声明协议
@objc protocol FullPopGestureRecognize {
    //声明协议对应的方法
    @objc optional func isAllowPopGestureShouldBegin(gestureRecognize:UIGestureRecognizer) -> Bool
    @objc optional func testProtocol()
}

//MARK: 协议的使用:默认定义的协议为必须实现的协议
//MARK: 定义可选协议的时候:当遵循协议的类不管有没有父类时候 定义可选协议时候 需要在协议方法名前面添加@objc 和对应的可选方法前面添加@objc
