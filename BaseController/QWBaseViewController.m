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
    self.view.backgroundColor = [UIColor whiteColor];
    NSLog(@"--- %@ --- 创建",NSStringFromClass([self class]));
    if(self.navigationController.viewControllers.count>1){
        [self createBack];
    }
}

- (void)createBack{
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeSystem];
    btn.frame = CGRectMake(0, 0, 30, 30);
    [btn setImage:[[UIImage imageNamed:@"back_black"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] forState:UIControlStateNormal];
    [btn setImage:[[UIImage imageNamed:@"back_black"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] forState:UIControlStateHighlighted];
    [btn addTarget:self action: @selector(doBack) forControlEvents: UIControlEventTouchUpInside];
    UIBarButtonItem *item = [[UIBarButtonItem alloc] initWithCustomView:btn];
    self.navigationItem.leftBarButtonItem = item;
    //侧滑返回
    self.navigationController.interactivePopGestureRecognizer.delegate = (id)self;
}
- (void)doBack{
    if(self.presentedViewController){
        [self dismissViewControllerAnimated:YES
                                 completion:nil];
    }else{
        [self.navigationController popViewControllerAnimated:YES];
    }
}
- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
}
- (void)viewDidDisappear:(BOOL)animated {
    [super viewDidDisappear:animated];
}
- (void)dealloc{
    NSLog(@"--- %@ --- 销毁",NSStringFromClass([self class]));
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
