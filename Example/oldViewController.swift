//
//  ViewController.swift
//  swizzling
//
//  Created by Mohamed Helmy on 5/19/18.
//  Copyright © 2018 Mohamed Helmy. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var programmaticallylocalizedLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()


self.programmaticallylocalizedLabel.text = NSLocalizedString("Test localize String", comment: "")
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func switchLangauge(_ sender: Any) {
        
        if MHLocalizable.currentAppleLanguage() == "en" {
            MHLocalizable.setAppleLanguageTo(lang: "ar")
         //   UIView.appearance().semanticContentAttribute = .forceRightToLeft
        } else {
            MHLocalizable.setAppleLanguageTo(lang: "en")
         //   UIView.appearance().semanticContentAttribute = .forceLeftToRight
        }
        
        //Optional
        MHLocalizable.reloadRootViewController(ViewControllerIdentifier: "rootnav")


        
        
    }
    
}

