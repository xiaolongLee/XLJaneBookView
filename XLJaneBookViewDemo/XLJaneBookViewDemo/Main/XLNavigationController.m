//
//  XLNavigationController.m
//  XLJaneBookViewDemo
//
//  Created by Mac-Qke on 2019/3/19.
//  Copyright © 2019 Mac-Qke. All rights reserved.
//

#import "XLNavigationController.h"

@interface XLNavigationController ()

@end

@implementation XLNavigationController

+ (void)initialize {
    UINavigationBar *bar = [UINavigationBar appearance];
    [bar setBarTintColor:[UIColor whiteColor]];
    
    NSMutableDictionary *attrs = [NSMutableDictionary dictionary];
    attrs[NSFontAttributeName] = [UIFont systemFontOfSize:16];
    attrs[NSForegroundColorAttributeName] = [UIColor blackColor];
    [bar setTitleTextAttributes:attrs];
}

- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated {
    if (self.childViewControllers.count > 0) {
        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
        [button setImage:[UIImage imageNamed:@"back"] forState:UIControlStateNormal];
        button.size = CGSizeMake(30, 30);
        [button addTarget:self action:@selector(back) forControlEvents:UIControlEventTouchUpInside];
        viewController.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:button];
        // 隐藏tabbar
        viewController.hidesBottomBarWhenPushed = YES;
    }
    
    [super pushViewController:viewController animated:animated];
}

- (void)back {
    [self popViewControllerAnimated:YES];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
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
