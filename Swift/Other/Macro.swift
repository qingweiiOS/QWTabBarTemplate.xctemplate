//
//  ___FILENAME___
//  ___PROJECTNAME___
//  微微卿 制作
//  Created by ___FULLUSERNAME___ on ___DATE___.
//  ___FULLUSERNAME___
//

import UIKit
let SRCEEN_W = UIScreen.mainScreen().bounds.size.width
let SRCEEN_H = UIScreen.mainScreen().bounds.size.height
let Main_Color = UIColor(red: 233.0/255.0, green: 82.0/255.0, blue: 82.0/255.0, alpha: 1)
func RGB(r: CGFloat,g: CGFloat,b : CGFloat) -> UIColor {
   return UIColor(red: r/255.0, green: g/255.0, blue: b/255.0, alpha: 1)
}
func IMG(imageName:String)->UIImage{
    
    return UIImage(named:imageName)!
}