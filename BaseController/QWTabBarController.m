//
//  ___FILENAME___
//  ___PROJECTNAME___
//  Created by Mr.Qing on 2020/12/23.
//  ___FULLUSERNAME___
//


#import "___FILEBASENAME___.h"
#import "QWNavitionController.h"
@interface ___FILEBASENAME___ ()

@end

@implementation ___FILEBASENAME___


- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self addChildViewControllers];
}
- (void)addChildViewControllers
{
#warning  添加 被TabBarCtl 控制的视图控制器 名称
    //视图控制器名称
    NSMutableArray *array = [NSMutableArray arrayWithArray:@[@"QWBaseViewController",@"QWBaseViewController",@"QWBaseViewController",@"QWBaseViewController"]];
#warning Set TabBarItem Nomal Icon Name
    NSArray *imgArray = @[@"TabBar_home_23x23_",@"TabBar_gift_23x23_",@"TabBar_category_23x23_",@"TabBar_me_boy_23x23_"];
#warning Set TabBarItem selected Icon Name
    NSArray *selectImageArray = @[@"TabBar_home_23x23_selected",@"TabBar_gift_23x23_selected",@"TabBar_category_23x23_selected",@"TabBar_me_boy_23x23_selected"];
#warning Set TabBarItem title
    NSArray *titles = @[@"你可以",@"选择警告",@"修改标题",@"和icon"];
#warning Set NavgationItem title
    NSArray *titles1 = @[@"导航栏标题1",@"导航栏标题2",@"导航栏标题3",@"导航栏标题4"];
    for(int i =0;i<array.count;i++)
    {
        UIViewController *vc = [[NSClassFromString(array[i]) alloc] init];
        QWNavitionController *nav = [[QWNavitionController alloc] initWithRootViewController:vc];
        vc.title = titles1[i];
        ;
        nav.tabBarItem.title = titles[i];
        
        nav.tabBarItem.image = [UIImage imageNamed:imgArray[i]];
        nav.tabBarItem.selectedImage = [[UIImage imageNamed:selectImageArray[i]] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        [array replaceObjectAtIndex:i withObject:nav];
    }
    self.viewControllers = array;
    self.tabBar.tintColor = [UIColor redColor];
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
 
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
