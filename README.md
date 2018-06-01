<h1 align="center">
  <img src="/Images/banner.png" height="175"/>
  <br>
  MHLocalizable
  <br>
</h1>

<h4 align="center">The Art of Swizzling and Localization</h4>

<p align="center">
  
   <img src="https://img.shields.io/badge/build-passing-green.svg"/>
   <img src="https://img.shields.io/badge/pod-v0.1.4-blue.svg"/>
   <img src="https://img.shields.io/badge/license-MIT-lightgrey.svg"/>
   <img src="https://img.shields.io/badge/platform-iOS%209%2B-red.svg"/>
   <img src="https://img.shields.io/badge/language-Swift%204-orange.svg"/>
   <img src="https://img.shields.io/badge/license-MIT-lightgrey.svg"/>
   
</p>


# MHLocalizable
MHLocalizable support all RTL and LTR languages , it's a simple and easy framework to improves localization your iOS App quickly, allow you to change language of project in-app without quiting the app by swizzling. it's working on Storyboard itself not string file or any other files. 

<br>
<p align="center">
  
<img src="/Images/gif.gif" width="300"/>
<br>
  <img src="/Images/d.png" width="200" height="400"/>
  <img src="/Images/e.png" width="200" height="400"/>
  <img src="/Images/u.png" width="200" height="400"/>
  <img src="/Images/f.png" width="200" height="400"/>

</p>

## Requirements
* iOS 9+
* Swift 4+

## Features

- [x] Full supported Swizzling so will change on the fly.
- [x] Working on Storyboard directly.
- [x] Did't use string file or any other files. 
- [x] Support all RTL and LTR languages, auto detecte and change the layout according to Language. 
- [x] Support reload any specific view after localization.
- [x] Support iOS 9.0+ 
- [x] Full documentation.
- [x] Support full example.


## Installation

### CocoaPods
Simply add the following to your project Podfile.
```swift
pod 'MHLocalizable'
```
### Manual
Simply add the this file MHLocalizable to your project project and it will do every thing.



## Usage
First in AppDelegate
```swift
import MHLocalizable
```
Add in "didFinishLaunchingWithOptions"
```swift
//TODO:- DoTheSwizzling
        MHLocalizable.DoTheSwizzling()
```
------------------
Add in your ViewController
```swift
import MHLocalizable
```
And in the action of button that will change the Language Add this
```swift
         if MHLocalizable.currentAppleLanguage() != "fr" {
                MHLocalizable.setAppleLanguageTo(lang: "fr")
                //optional to reload any specific view don't forget change the "Identifier"
                MHLocalizable.reloadRootViewController(ViewControllerIdentifier: "your ViewController Identifier")
            }
```


## Contributing
Thank you <a href="https://www.Appsinnovate.com/">Appsinnovate</a> for Support.
Thank you <a href="https://medium.com/@dark_torch/">moath othman</a> for Inspiration.

Pull requests are welcome. For major changes, please open an issue first to discuss what you would like to change.



## License
[MIT](https://choosealicense.com/licenses/mit/)
