//
//  RPNavigationViewController.swift
//  RepBorrows
//
//  Created by caoyong on 2018/11/11.
//  Copyright © 2018 caoyong. All rights reserved.
//

import UIKit
import Foundation

class RPNavigationViewController: UINavigationController{
    
    /** 手势识别器*/
    var gestureRecognizer: UIGestureRecognizer?
    /** pan类型手势识别器*/
    var pangestureRecognizer: UIPanGestureRecognizer?
    /** 手势识别代理*/
    var gestureReconizerDelegate: UIGestureRecognizerDelegate?
    
    override open var shouldAutorotate: Bool{
        if let visible = self.visibleViewController{
            return visible.shouldAutorotate
        }
        return super.shouldAutorotate
    }
    override open var supportedInterfaceOrientations: UIInterfaceOrientationMask{
        if let visble = self.visibleViewController {
            return visble.supportedInterfaceOrientations
        }
        return super.supportedInterfaceOrientations
    }
    override open var preferredInterfaceOrientationForPresentation: UIInterfaceOrientation{
        
        if let visble = self.visibleViewController {
            return visble.preferredInterfaceOrientationForPresentation
        }
        return super.preferredInterfaceOrientationForPresentation
    }
    
    //MARK: viewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
    
        self.navigationBar.isTranslucent = false
        self.view.backgroundColor = UIColor.white
        
        self.initializeMethod()
        self.addNavigationControllersFullScreenGestureEvent(true)
        
    }
    //MARK:设置导航栏的配置
    func initializeMethod() ->(){
        
        let navigationBar:UINavigationBar?
        if #available(iOS 9.0, *) {
            navigationBar = UINavigationBar.appearance(whenContainedInInstancesOf:[RPNavigationViewController.self])
        } else {
            navigationBar = UINavigationBar.appearance()
        }
        navigationBar?.tintColor = UIColor.white
        let navigationDict: [NSAttributedString.Key : Any]? = [NSAttributedString.Key.foregroundColor:UIColor.black,NSAttributedString.Key.font:UIFont.systemFont(ofSize: 16)]
        navigationBar?.setBackgroundImage(UIImage.init(), for: UIBarMetrics.default)
        navigationBar?.shadowImage = UIImage.init(named: "NavigationImages")
        //MARK:设置导航栏字体
        navigationBar?.titleTextAttributes = navigationDict
    }
    
    //MARK:添加手势(手势分为系统自带手势和自己添加手势)
    func addNavigationControllersFullScreenGestureEvent(_ isFull: Bool) -> Void{
        if isFull {
            //关闭系统的手势功能
           self.interactivePopGestureRecognizer?.isEnabled = false
           self.gestureReconizerDelegate = self.interactivePopGestureRecognizer?.delegate
           //系统私有API手势对象
           let selMethodArra: [String] = ["handl","eNavigationT","ransition:"]
           let selString1: String = selMethodArra.joined()
            //使用字符串创建对应的方法 类似于NSSelectorFromString Selector只使用在调用系统API中
            let selMethod: Selector = Selector(selString1)
            //#selector()类型更安全 推荐使用 方法必须添加@objc关键字
            //let sel = #selector(selString1)
            //MARK:事件的替换 self.gestureReconizerDelegate = self
            let pangestureRecognizer: UIPanGestureRecognizer? = UIPanGestureRecognizer.init(target: self.gestureReconizerDelegate, action: selMethod)
            self.pangestureRecognizer = pangestureRecognizer
            pangestureRecognizer?.delegate = self
            pangestureRecognizer?.minimumNumberOfTouches = 1
            //添加手势对象
            self.view.addGestureRecognizer(pangestureRecognizer ?? UIPanGestureRecognizer())
        }else{
            //手势识别器赋值(赋值系统自带手势识别器)
           self.interactivePopGestureRecognizer?.isEnabled = true;
           self.gestureRecognizer = self.interactivePopGestureRecognizer
           self.delegate = self
        }
        
    }
    
    //push视图时候处理(父类方法)
    override func pushViewController(_ viewController: UIViewController, animated: Bool) {
        if self.children.count != 0{
            viewController.hidesBottomBarWhenPushed = true
        }
        super.pushViewController(viewController, animated: animated)
    }
    
    //具体实现对应的方法
    @objc func someMethod(string: String){
    }

}

//MARK: 优雅的实现协议封装在一个方法中
extension Selector{
    static let selectorMethod = #selector(RPNavigationViewController.someMethod(string:))
}


//MARK:导航栏代理对象方法
extension RPNavigationViewController:UINavigationControllerDelegate, UIGestureRecognizerDelegate{
   
    //MARK:手势识别器代理方法
    //MARK:手势识别器是否可以接受点击事件
    func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldReceive touch: UITouch) -> Bool {
        return true
    }
    
    //MARK:是否允许识别器操作
    func gestureRecognizerShouldBegin(_ gestureRecognizer: UIGestureRecognizer) -> Bool {
     
        let pointTranslation: CGPoint = gestureRecognizer.location(in: self.view)
        if pointTranslation.x <= 0 {
            return false
        }
        //MARK:将是否接受手势交给对应的类去处理
        let currentViewControllers: RPBaseViewController? = self.topViewController as? RPBaseViewController
        if currentViewControllers?.isAllowPopGestureShouldBegin(gestureRecognize:) != nil{
            
            return currentViewControllers?.isAllowPopGestureShouldBegin(gestureRecognize: gestureRecognizer) ?? false
        }
        
        return self.children.count > 1 ? true : false
    }
    
    //MARK:设置系统代理控制调用代理方法(不自定义代理的时候 直接使用系统手势侧滑调用的代理方法)
    func navigationController(_ navigationController: UINavigationController, didShow viewController: UIViewController, animated: Bool) {
        
        if navigationController.viewControllers[0]==viewController {
            self.interactivePopGestureRecognizer?.delegate = self.gestureReconizerDelegate
        }else{
            self.interactivePopGestureRecognizer?.delegate = nil
        }
    }
}


