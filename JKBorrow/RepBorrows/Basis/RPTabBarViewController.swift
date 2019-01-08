//
//  RPTabBarViewController.swift
//  RepBorrows
//
//  Created by caoyong on 2018/11/11.
//  Copyright © 2018 caoyong. All rights reserved.
//

import UIKit
/*!
 * 分栏控制器
 */
class RPTabBarViewController: UITabBarController{
    
    override open var shouldAutorotate: Bool{
        if let select = self.selectedViewController{
            return select.shouldAutorotate
        }
        return super.shouldAutorotate
    }
    override open var supportedInterfaceOrientations: UIInterfaceOrientationMask{
        if let select = self.selectedViewController {
            return select.supportedInterfaceOrientations
        }
        return super.supportedInterfaceOrientations
    }
    override open var preferredInterfaceOrientationForPresentation: UIInterfaceOrientation{
        
        if let select = self.selectedViewController {
            return select.preferredInterfaceOrientationForPresentation
        }
        return super.preferredInterfaceOrientationForPresentation
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        //MARK: 1 当一个类型定义为可选类型的时候 也就是说赋值的时候可以赋值nil或者一个对应类型的值 值对应的类型不为可选的  否则不能赋值为nil  2 当选择访问可选类型值的时候 必须使用对应类然后解包访问(可选链式访问)
        self.delegate = self
        self.tabBar.backgroundColor = UIColor.white
        self.tabBar.barTintColor = UIColor.white
        self.tabBarController?.tabBar.clipsToBounds = true
        //更新iOS12.0以后 设置tabBar在二级界面返回时候出现跳动
        self.tabBar.isTranslucent = false
        //去掉tabbar后面的黑线
        self.tabBar.barStyle = UIBarStyle.black
        //shadowImage 接受可选对象 UIImage(named: "")返回可选对象
        self.tabBar.shadowImage = UIImage(named: "TabBarImages")
        self.tabBar.backgroundImage = UIImage()
        
        self.configurationWithTabBarItem()
    }
    
    //MARK:配置tabBar 标题&&图标
    func configurationWithTabBarItem() -> Void{
        
        let titleArrays:[String] = ["首页","我的"]
        let imageArrays:[String] = ["home_unselectImages","mine_unselectImages"]
        let selectedImageArrays:[String] = ["home_selectImages","mine_selectImages"];
        //循环遍历
        for index in 0..<imageArrays.count {
            let titleNameString:String? = titleArrays[index]
            let unSelectImageString:String? = imageArrays[index]
            let selectImageString:String? = selectedImageArrays[index]
            //MARK:获取导航栏控制器  1"as"子类向父类转换对象 as 还有判断类型  2 as! && as? 都是父类向下转换为子类对象
            let navigationController:UINavigationController = self.viewControllers?[index] as! UINavigationController
            //MARK:获取对应导航栏控制器的根视图
            let subViewController:UIViewController = navigationController.viewControllers[0]
            let tabBarItem:UITabBarItem = UITabBarItem(title: titleNameString, image:self.tabBarItemImage(string: unSelectImageString), selectedImage: self.tabBarItemImage(string: selectImageString))
                tabBarItem.setTitleTextAttributes([.foregroundColor : UIColor.black], for:.normal)
               tabBarItem.setTitleTextAttributes([NSAttributedString.Key.foregroundColor :UIColor(red: 250/255, green: 127/244, blue: 72/255, alpha: 1)], for: UIControl.State.selected)
            //MARK:设置对应的tabBarItem
            subViewController.tabBarItem = tabBarItem
        }
    }
    
    //MARK:更加颜色转换为对应颜色的UIImage
    func initWithImage(color:UIColor) -> UIImage {
        let rect = CGRect(x: 0,y: 0,width: 1,height: 1)
        UIGraphicsBeginImageContext(rect.size)
        let context = UIGraphicsGetCurrentContext()
        context!.setFillColor(color.cgColor)
        context!.fill(rect)
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return image!
    }
    
    //MARK:获取对应图片&&图片模式
    func tabBarItemImage(string: String?) -> UIImage? {
        if let news = string {
            if !(news.isEmpty) {
               let imageName:UIImage? = UIImage(named: news)?.withRenderingMode(.alwaysOriginal)
               return imageName
        }else{
           return nil
        }
    }
     return nil
   }
}

extension RPTabBarViewController:UITabBarControllerDelegate{
    
    //MARK:是否可以选择对应的控制器
    func tabBarController(_ tabBarController: UITabBarController, shouldSelect viewController: UIViewController) -> Bool {
        
        return true
    }
    
    //MARK:选择对应的控制器
    func tabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController) {
        //选择的控制器在tabBarControllers中的位置
        let index: Int = tabBarController.index(ofAccessibilityElement: viewController)
        tabBarController.selectedIndex = index
    }
}
