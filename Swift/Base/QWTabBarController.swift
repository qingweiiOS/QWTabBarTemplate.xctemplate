
//  ___FILENAME___
//  ___PROJECTNAME___
//  微微卿 制作
//  Created by ___FULLUSERNAME___ on ___DATE___.
//  ___FULLUSERNAME___

import UIKit

class QWTabBarController: UITabBarController {
    /// 图标数组 接受外界设置
    var imageArray:Array<String>=[]{
        didSet{
            guard imageArray.count>0 else{
                return
            }
            if childViewControllers.count > 0
            {
                //设置图标
                setItemIcon()
            }
            
        }
    }
    /// 选中 图标数组 接受外界设置
    var selectImageArray:Array<String>=[]{
        didSet{
            guard selectImageArray.count>0 else{
                return
            }
            if childViewControllers.count > 0
            {
                //设置选中图标
                setSelectItemIcon()
            }
            
        }
    }
    /// 视图控制器数组 接受外界设置
    var VCArray:Array<AnyObject>?{
        didSet{
            guard VCArray?.count>0 else{
                return
            }
            if(titleArray.count<=0)
            {
                for i in 0..<Int((VCArray?.count)!)
                {
                    titleArray.append("标题\(i)")
                }
            }
            if(imageArray.count<=0)
            {
                imageArray = ["TabBar_home_23x23_","TabBar_gift_23x23_","TabBar_category_23x23_","TabBar_me_boy_23x23_"]
            }
            if(selectImageArray.count<=0)
            {
                selectImageArray = ["TabBar_home_23x23_selected","TabBar_gift_23x23_selected","TabBar_category_23x23_selected","TabBar_me_boy_23x23_selected"]
            }
            //添加子视图控制器
            addChildViewControllers()
        }
    }
    /// 标题数组 接受外界设置
    var titleArray:Array<String> = []{
        didSet{
            guard titleArray.count>0 else{
                return
            }
            if childViewControllers.count > 0
            {
                //设置标题
                setTitles()
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor.whiteColor()
        
    }
    func addChildViewControllers(){
        //防止外界多次设置造成错乱 移除
        for vc in childViewControllers
        {
            vc.removeFromParentViewController()
        }
        //类名
        let array = self.VCArray
        for i in 0..<array!.count
        {
            let cName = array![i]
            //动态获取命名空间
            //(CFBundleExecutable这个键对应的值就是项目名称,也就是命名空间)
            let nameSpace = NSBundle.mainBundle().infoDictionary!["CFBundleExecutable"] as! String
            //将字符串转化为类
            //默认情况下,命名空间就是项目名称,但是命名空间是可以修改的
            let cls:AnyClass? = NSClassFromString(nameSpace + "." + (cName as! String))
            //通过类创建对象
            //将anyClass转换为指定的类型
            let viewControllerCls = cls as! UIViewController.Type
            //通过class创建对象
            let vc = viewControllerCls.init()
            //包装导航栏
            let navCtl = QWNavitionController.init(rootViewController:vc)
            addChildViewController(navCtl)
            //                navCtl.tabBarItem.selectedImage = UIImage(named:imgName+"selected")
            
        }
        //设置选项卡标题
        setTitles()
        //设置图标
        setItemIcon()
        //设置选中图标
        setSelectItemIcon()
        self.tabBar.tintColor = Main_Color
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
//设置 元素
extension QWTabBarController{
    
    
    
    /**
     设置标题
     */
    func setTitles(){
        
        let count = childViewControllers.count>titleArray.count ? titleArray.count:childViewControllers.count
        for index in 0..<count
        {
            let navVC  = childViewControllers[index] as? QWNavitionController
            navVC!.tabBarItem.title = titleArray[index]
            let vc = navVC?.topViewController
            vc?.navigationItem.title = titleArray[index]
        }
        
    }
    /**
     设置图标
     */
    func setItemIcon(){
        let count = childViewControllers.count>titleArray.count ? titleArray.count:childViewControllers.count
        
        for index in 0..<count
        {
            let navVC  = childViewControllers[index] as? QWNavitionController
            navVC!.tabBarItem.image = IMG(imageArray[index])
        }
    }
    func setSelectItemIcon(){
        let count = childViewControllers.count>titleArray.count ? titleArray.count:childViewControllers.count
        for index in 0..<count
        {
            let navVC  = childViewControllers[index] as? QWNavitionController
            navVC!.tabBarItem.selectedImage = IMG(imageArray[index])
        }
        
    }
    
}

