//
//  XLMyController.m
//  XLJaneBookViewDemo
//
//  Created by Mac-Qke on 2019/3/20.
//  Copyright © 2019 Mac-Qke. All rights reserved.
//

#import "XLMyController.h"
#import "XLPersonalHomePageController.h"
#import "XLSettingController.h"
@interface XLMyController ()

@end

@implementation XLMyController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self setupNav];
    [self setupUI];
}

/// 设置导航栏右边的按钮
- (void)setupNav {
    UIBarButtonItem *settingButton = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"setting"] style:UIBarButtonItemStylePlain target:self action:@selector(settingBtnClick)];
    self.navigationItem.rightBarButtonItem = settingButton;
    
}


- (void)settingBtnClick {
    XLSettingController *settingVC = [[XLSettingController alloc] init];
    [self.navigationController pushViewController:settingVC animated:YES];
}


- (void)setupUI{
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.view addSubview:button];
    CGSize size = CGSizeMake(100, 40);
    [button mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.equalTo(self.view);
        make.size.mas_equalTo(size);
    }];
    [button setTitle:@"点击进入" forState:UIControlStateNormal];
    [button setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    [button addTarget:self action:@selector(btnClicked) forControlEvents:UIControlEventTouchUpInside];
    
}


- (void)btnClicked {
    XLPersonalHomePageController *personHomePageVC = [[XLPersonalHomePageController alloc] init];
    personHomePageVC.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:personHomePageVC animated:YES];
    
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
