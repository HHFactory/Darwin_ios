//
//  AppDelegate.swift
//  Darwin_ios
//
//  Created by hide on 2016/10/11.
//  Copyright © 2016年 HHFactory. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    
    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        return true
    }
    
    
    /**
     アプリが終了する前の処理
     
     - parameter application: <#application description#>
     */
    func applicationWillResignActive(application: UIApplication) {
    }

    
    /**
     アプリを閉じた時に呼ばれる処理
     willResignActive後に呼ばれる
     
     - parameter application: <#application description#>
     */
    func applicationDidEnterBackground(application: UIApplication) {
    }

    
    /**
     アプリが開く前の処理
     
     - parameter application: <#application description#>
     */
    func applicationWillEnterForeground(application: UIApplication) {
    }

    
    /**
     アプリが開いた後の処理
     willEnterForegroudの後に呼ばれる
     
     - parameter application: <#application description#>
     */
    func applicationDidBecomeActive(application: UIApplication) {
    }

    
    /**
     バックグラウンドで完全に終了された時の処理
     
     - parameter application: <#application description#>
     */
    func applicationWillTerminate(application: UIApplication) {

    }


}

