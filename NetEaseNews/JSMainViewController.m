//
//  JSMainViewController.m
//  NetEaseNews
//
//  Created by leo on 20/10/2016.
//  Copyright © 2016 leo. All rights reserved.
//

#import "JSMainViewController.h"
#import "JSLeftMenu.h"

@interface JSMainViewController ()

@end

@implementation JSMainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 1.添加左侧菜单
    JSLeftMenu *leftMenu = [[JSLeftMenu alloc] init];
    leftMenu.height = 300;
    leftMenu.width = 200;
    leftMenu.y = 60;
    leftMenu.backgroundColor = JSRandomColor;
    
    [self.view addSubview:leftMenu];
}


@end
