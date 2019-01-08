//
//  main.swift
//  RepBorrows
//
//  Created by caoyong on 2018/11/8.
//  Copyright © 2018 caoyong. All rights reserved.
//

import UIKit

class myApplication: UIApplication {
    override func sendEvent(_ event: UIEvent) {
        super.sendEvent(event)
        print("sendEvent")
    }
}

//MARK:--- 设置applocation主程序的入口 swift3.0以前
/*
UIApplicationMain(Process.argc, Process.unsafeArgv, nil, NSStringFromClass(myApplication))
*/

//MARK:--- 设置application主程序入口 swift4.2以前
/*
UIApplicationMain(CommandLine.argc, UnsafeMutableRawPointer(CommandLine.unsafeArgv).bindMemory(to: UnsafeMutablePointer<Int8>.self, capacity: Int(CommandLine.argc)), nil, NSStringFromClass(AppDelegate.self));
 */

//MARK: --- 设置主程序重载入口 swift4.2
UIApplicationMain(CommandLine.argc, CommandLine.unsafeArgv, nil, NSStringFromClass(AppDelegate.self));

//TODO: --- 如果需要设置自己定义的类作为UIAPPlication
/*
UIApplicationMain(CommandLine.argc, CommandLine.unsafeArgv, NSStringFromClass(myApplication.self), NSStringFromClass(AppDelegate.self));
*/

//FIXME: --- swift语法
//.self 放正类型后面表示类型本身 NSStringFromClass()需要类型
//.self 放在实例对象后面获取该实例对象
//.type 获取某个类的元“类型“

//初始化数组&&字典时候需要指定集合存储的类型(否则会报错)
/*
var arrays = Array<String>()
var arrayss = [Int]()
var dictionarys = Dictionary<Int,String>()
var dictionaryss = [Int:String]()
*/
//MARK: --- any && anyobject && anyclass

//Any: Any不仅仅可以包括class类型、所有的类型都可以使用Any来表示、包括基本数据类型、enum,struct、func(方法)等等、代表除了函数的实例外任何类型的实例都可以
//AnyObject: 代表任何class类型的对象实例
//ObjectClass:代表任意类的元类型、任意类的类型都隐式的遵循这个协议、代码使用不多
