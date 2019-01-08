//
//  RPHomeViewController.swift
//  RepBorrows
//
//  Created by caoyong on 2018/11/11.
//  Copyright © 2018 caoyong. All rights reserved.
//

import UIKit

class RPHomeViewController: RPBaseViewController {
    
    /** tableView视图 **/
    var RPHomeTableView:UITableView?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = UIColor.clear
    }
    
   //MARK:重写是否允许响应测滑手势
   override func isAllowPopGestureShouldBegin(gestureRecognize: UIGestureRecognizer) -> Bool {
        return false
    }

}


class Person {
    
    //MARK:1 class和static都是表示类型范围作用域的关键字
    //MARK:1 class类型中可以使用class和static修饰来表达类型范围作用域 枚举和结构体中只能使用static修饰表达类型范围作用域 2 class类型中 存储属性不能使用class修饰 只能使用static关键字修饰(类似OC中的类方法定义)
    
    //static修饰 子类不能重写任何属性和方法
    static var age: Int = 20
    static var workingTime:Int{
        return 20
    }
    static func sleepTime(){
    }
    // static修饰的不能重写  classx修饰的可以重写
    //Class修饰 存储属性不能使用class关键字修饰 能用static修饰 子类可以重写方法和计算属性
    static var age1: Int = 20  //使用classs修饰 会报运行时错误
    class var workingTime1:Int{
        return 20
    }
    class func sleepTime1(){
    }
}

class son: Person {
    //MARK:重写的类型修饰的关键字可以是class修饰或者static都可以
    override class var workingTime1:Int{
        return 100
    }
    override class func sleepTime1(){
        
    }
}
