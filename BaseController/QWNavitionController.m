//
//  ___FILENAME___
//  ___PROJECTNAME___
//  Created by Mr.Qing on 2020/12/23.
//  ___FULLUSERNAME___
//


#import "___FILEBASENAME___.h"

@interface ___FILEBASENAME___ ()

@end

@implementation ___FILEBASENAME___

- (void)viewDidLoad {
    [super viewDidLoad];
    #warning set NavigationItem Style
    self.navigationBar.barTintColor = [UIColor whiteColor];
//    [self.navigationBar setBackgroundImage:UIImage.new forBarMetrics:UIBarMetricsDefault];
//    [self.navigationBar setShadowImage:UIImage.new];
    [self.navigationBar setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor blackColor],NSFontAttributeName:[UIFont systemFontOfSize:30.0]}];
}
- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated
{
    if (self.childViewControllers.count==1) {
        viewController.hidesBottomBarWhenPushed = YES;
    }
    [super pushViewController:viewController animated:YES];
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
