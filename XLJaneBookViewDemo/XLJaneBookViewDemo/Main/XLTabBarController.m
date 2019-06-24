//
//  XLTabBarController.m
//  XLJaneBookViewDemo
//
//  Created by Mac-Qke on 2019/3/19.
//  Copyright © 2019 Mac-Qke. All rights reserved.
//

#import "XLTabBarController.h"
#import "XLNavigationController.h"
@interface XLTabBarController ()
@property (nonatomic, weak) UIButton *composeButton;
@end

@implementation XLTabBarController

#pragma mark -- 统一设置所有 UITabBarItem 的文字属性

+ (void)initialize {
    NSMutableDictionary *attrs = [NSMutableDictionary dictionary];
    attrs[NSFontAttributeName] = [UIFont systemFontOfSize:12];
    attrs[NSForegroundColorAttributeName] = [UIColor grayColor];
    
    NSMutableDictionary *selectedAttrs = [NSMutableDictionary dictionary];
    selectedAttrs[NSFontAttributeName] = attrs[NSFontAttributeName];
    selectedAttrs[NSForegroundColorAttributeName] = [UIColor colorWithRed:255/255.0 green:125/255.0 blue:0 alpha:1];
    
    UITabBarItem *items = [UITabBarItem appearance];
    [items setTitleTextAttributes:attrs forState:UIControlStateNormal];
    [items setTitleTextAttributes:selectedAttrs forState:UIControlStateSelected];
}


#pragma mark --初始化
- (instancetype)init {
    if (self = [super init]) {
        [self addChildViewControllers];
        [self addComposeButton];
    }
    return self;
}


#pragma mark ---添加所有子控制器
- (void)addChildViewControllers {
    [self  addChildViewControllerClassName:@"XLHomePageController" title:@"首页" imageName:@"tabbar_home"];
    [self addChildViewControllerClassName:@"XLFoundController" title:@"发现" imageName:@"tabbar_discover"];
    [self addChildViewController: [[UIViewController alloc] init]];
    [self addChildViewControllerClassName:@"XLMessageController" title:@"消息" imageName:@"tabbar_message_center"];
    [self addChildViewControllerClassName:@"XLMyController" title:@"我的" imageName:@"tabbar_profile"];
    
}


#pragma mark --添加中间的按钮
- (void)addComposeButton {
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setImage:[UIImage imageNamed:@"tabBar_publish_icon"] forState:UIControlStateNormal];
    [button setImage:[UIImage imageNamed:@"tabBar_publish_icon_highlighted"] forState:UIControlStateSelected];
    [button addTarget:self action:@selector(composeButtonClick:) forControlEvents:UIControlEventTouchUpInside];
    self.composeButton = button;
    [self.tabBar addSubview:button];
    [self.tabBar bringSubviewToFront:button];
    CGFloat width = self.tabBar.bounds.size.width / self.childViewControllers.count -2;
    self.tabBar.tintColor = [UIColor colorWithRed:68/255.0 green:173/255.0 blue:159/255.0 alpha:1];
    button.frame = CGRectInset(self.tabBar.bounds, 2 * width, 0);
    
    
}

#pragma mark -- 点击写文章按钮
- (void)composeButtonClick:(UIButton *)button {
    NSLog(@"\n点击了写文章按钮");
}


#pragma mark -- 设置所有子控制器
- (void)addChildViewControllerClassName:(NSString *)className title:(NSString *)title imageName:(NSString *)imageName {
    
    UIViewController *viewController = [[NSClassFromString(className) alloc] init];
    XLNavigationController *nav = [[XLNavigationController alloc] initWithRootViewController:viewController];
    viewController.title = title;
    viewController.view.backgroundColor = [UIColor whiteColor];
    viewController.tabBarItem.image = [UIImage imageNamed:imageName];
    viewController.tabBarItem.selectedImage = [UIImage imageNamed:[NSString stringWithFormat:@"%@_highlighted",imageName]];
    [self addChildViewController:nav];
}

-  (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self.tabBar bringSubviewToFront:self.composeButton];
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
