//
//  RPCenterViewController.swift
//  RepBorrows
//
//  Created by caoyong on 2018/11/11.
//  Copyright © 2018 caoyong. All rights reserved.
//

import UIKit

class RPCenterViewController: RPBaseViewController
{
    override func viewDidLoad(){
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor.clear
    }
    
    //MARK:重写是否允许响应测滑手势
    override func isAllowPopGestureShouldBegin(gestureRecognize: UIGestureRecognizer) -> Bool {
        return false
    }
}
