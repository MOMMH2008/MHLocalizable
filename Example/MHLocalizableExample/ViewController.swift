//
//  ViewController.swift
//  MHLocalizableExample
//
//  Created by Mohamed Helmy on 5/31/18.
//  Copyright © 2018 Mohamed Helmy. All rights reserved.
//

import UIKit
import MHLocalizable

class ViewController: UIViewController {
    
    @IBOutlet weak var imgLang: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    override func viewWillAppear(_ animated: Bool) {
        
        switch MHLocalizable.currentAppleLanguage() {
        case "de":imgLang.image = UIImage.init(named: "g")
        case "en":imgLang.image = UIImage.init(named: "u")
        case "fr":imgLang.image = UIImage.init(named: "f")
        case "ar":imgLang.image = UIImage.init(named: "e")
        default:
            imgLang.image = UIImage.init(named: "e")
        }
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func switchLanguage(_ sender: UIButton) {
        
        switch sender.tag {
        case 1:
            
            if MHLocalizable.currentAppleLanguage() != "de" {
                MHLocalizable.setAppleLanguageTo(lang: "de")
                self.reloadRootViewController()
            }
        case 2:
            
            if MHLocalizable.currentAppleLanguage() != "en" {
                MHLocalizable.setAppleLanguageTo(lang: "en")
                self.reloadRootViewController()
            }
        case 3:
            
            if MHLocalizable.currentAppleLanguage() != "fr" {
                MHLocalizable.setAppleLanguageTo(lang: "fr")
                self.reloadRootViewController()
            }
            
        case 4:
            
            if MHLocalizable.currentAppleLanguage() != "ar" {
                MHLocalizable.setAppleLanguageTo(lang: "ar")
                self.reloadRootViewController()
            }
            
        default:
            MHLocalizable.setAppleLanguageTo(lang: "en")
            self.reloadRootViewController()
        }
        
    }
    
    func reloadRootViewController(){
        MHLocalizable.reloadRootViewController(ViewControllerIdentifier: "Languages")
    }
    
}

