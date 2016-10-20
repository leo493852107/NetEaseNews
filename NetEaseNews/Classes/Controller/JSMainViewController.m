//
//  JSMainViewController.m
//  NetEaseNews
//
//  Created by leo on 20/10/2016.
//  Copyright © 2016 leo. All rights reserved.
//

#import "JSMainViewController.h"
#import "JSLeftMenu.h"
#import "JSNavigationController.h"
#import "JSNewsViewController.h"

@interface JSMainViewController ()


@end

@implementation JSMainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 1.添加左侧菜单
    JSLeftMenu *leftMenu = [[JSLeftMenu alloc] init];
    leftMenu.height = 500;
    leftMenu.width = 200;
    leftMenu.y = 60;
    [self.view addSubview:leftMenu];
    
    // 2.创建子控制器
    JSNewsViewController *newsVC = [[JSNewsViewController alloc] init];
    newsVC.view.backgroundColor = JSRandomColor;
    JSNavigationController *newsNav = [[JSNavigationController alloc] initWithRootViewController:newsVC];
    [self.view addSubview:newsNav.view];
    
    [self addChildViewController:newsNav];
    
}


@end
