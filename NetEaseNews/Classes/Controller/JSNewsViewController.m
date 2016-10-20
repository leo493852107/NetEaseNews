//
//  JSNewsViewController.m
//  NetEaseNews
//
//  Created by leo on 20/10/2016.
//  Copyright © 2016 leo. All rights reserved.
//

#import "JSNewsViewController.h"
#import "JSTitleView.h"

@interface JSNewsViewController ()

@end

@implementation JSNewsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 1.标题
    JSTitleView *titleView = [[JSTitleView alloc] init];
    titleView.width = 100;
    titleView.height = 35;
    titleView.title = @"新闻";
    self.navigationItem.titleView = titleView;
    
    // 2.左右按钮
    self.navigationItem.leftBarButtonItem = [UIBarButtonItem itemWithImageName:@"top_navigation_menuicon" highImageName:@"" target:self action:@selector(leftMenu)];
    self.navigationItem.rightBarButtonItem = [UIBarButtonItem itemWithImageName:@"top_navigation_infoicon" highImageName:@"" target:self action:@selector(rightMenu)];
    
}

- (void)leftMenu {
    NSLog(@"left");
    
    [UIView animateWithDuration:0.25 animations:^{
        if (CGAffineTransformIsIdentity(self.navigationController.view.transform)) {
            // 缩放比例
            CGFloat scale = 500.0 / JSScreenHeight;
            
            // 菜单左边的间距
            CGFloat leftMenuMargin = JSScreenWidth * (1-scale) * 0.5;
            CGFloat translateX = 200 - leftMenuMargin;
            
            CGFloat topMargin = JSScreenHeight * (1-scale) * 0.5;
            CGFloat translateY = topMargin - 60;
            
            // 缩放
            CGAffineTransform scaleForm = CGAffineTransformMakeScale(scale, scale);
            // 平移
            CGAffineTransform translateForm = CGAffineTransformTranslate(scaleForm, translateX / scale, -translateY/scale);
            
            self.navigationController.view.transform = translateForm;
        } else {
            self.navigationController.view.transform = CGAffineTransformIdentity;
        }
    }];
}

- (void)rightMenu {
    NSLog(@"right");
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
