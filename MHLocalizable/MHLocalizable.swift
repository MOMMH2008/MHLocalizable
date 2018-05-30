//
//  MHLocalizable.swift
//  swizzling
//
//  Created by Mohamed Helmy on 5/19/18.
//  Copyright © 2018 Mohamed Helmy. All rights reserved.
//

import Foundation
import UIKit
// constants
let APPLE_LANGUAGE_KEY = "AppleLanguages"

class MHLocalizable {
    
    //MARK:- Get the Current Apple Language
    class func currentAppleLanguage() -> String{
        let userdef = UserDefaults.standard
        
        let langArray = userdef.object(forKey: APPLE_LANGUAGE_KEY) as! NSArray
        
        let current = langArray.firstObject as! String
        
        return current
    }
    
    
    //MARK:- Set Apple Language
    class func setAppleLanguageTo(lang: String) {
        let userdef = UserDefaults.standard
        
        userdef.set([lang,currentAppleLanguage()], forKey: APPLE_LANGUAGE_KEY)
        
        userdef.synchronize()
        
        check_RTL_LTR()
 
    }
    
    //MARK:- Change View  Appearance (LTR or RTL)
    class func check_RTL_LTR(){
        switch MHLocalizable.currentAppleLanguage() {
        case "ar","arc","az","dv","he","ku","fa","ur":
            UIView.appearance().semanticContentAttribute = .forceRightToLeft
        default:
            UIView.appearance().semanticContentAttribute = .forceLeftToRight
        }
    }
    
    //MARK:- Do Language Swizzling
    class func DoTheSwizzling() {
        MethodSwizzleGivenClassName(cls: Bundle.self, originalSelector: #selector(Bundle.localizedString(forKey:value:table:)), overrideSelector: #selector(Bundle.specialLocalizedStringForKey(key:value:table:)))
    }
    
    /// Exchange the implementation of two methods for the same Class
    class func MethodSwizzleGivenClassName(cls: AnyClass, originalSelector: Selector, overrideSelector: Selector) {
        
        let origMethod: Method = class_getInstanceMethod(cls, originalSelector)!;
        
        let overrideMethod: Method = class_getInstanceMethod(cls, overrideSelector)!;
        
        if (class_addMethod(cls, originalSelector, method_getImplementation(overrideMethod), method_getTypeEncoding(overrideMethod))) {
            class_replaceMethod(cls, overrideSelector, method_getImplementation(origMethod), method_getTypeEncoding(origMethod));
        } else {
            method_exchangeImplementations(origMethod, overrideMethod);
        }
    }
    
    //MARK:- Reload RootViewController
    class func reloadRootViewController(ViewControllerIdentifier:String, storyboardName:String = "Main" , animation:Bool = true){
        
        let mainwindow = (UIApplication.shared.delegate?.window!)!
        let story = UIStoryboard.init(name: storyboardName, bundle: nil)
        mainwindow.rootViewController = story.instantiateViewController(withIdentifier: ViewControllerIdentifier)
        if (animation){
            mainwindow.backgroundColor = UIColor(hue: 0.5, saturation: 0.5, brightness: 0.5, alpha: 0.8)
            UIView.transition(with: mainwindow, duration: 0.5, options: .transitionFlipFromLeft, animations: { () -> Void in
            }) { (finished) -> Void in
            }
        }
    }
}

//MARK:- Bundle Extension
extension Bundle {
    
    @objc func specialLocalizedStringForKey(key: String, value: String?, table tableName: String?) -> String {
        let currentLanguage = MHLocalizable.currentAppleLanguage()
        var bundle = Bundle();
        if let _path = Bundle.main.path(forResource: currentLanguage, ofType: "lproj") {
            bundle = Bundle(path: _path)!
        } else {
            let _path = Bundle.main.path(forResource: "Base", ofType: "lproj")!
            bundle = Bundle(path: _path)!
        }
        return (bundle.specialLocalizedStringForKey(key: key, value: value, table: tableName))
    }
}

