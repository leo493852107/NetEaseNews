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
#import "JSReadingViewController.h"
#import "JSPhotoViewController.h"
#import "JSVideoViewController.h"
#import "JSCommentViewController.h"
#import "JSRadioViewController.h"
#import "JSTitleView.h"

#define JSNavShowAnimationDuration 0.2

@interface JSMainViewController () <JSLeftMenuDelegate>

/** 正在显示的导航控制器 */
@property (nonatomic, weak) JSNavigationController *showingNavigationController;

@end

@implementation JSMainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 1.创建子控制器
    // 1.1.新闻控制器
    JSNewsViewController *newsVC = [[JSNewsViewController alloc] init];
    [self setupVC:newsVC title:@"新闻"];
    // 1.2.订阅控制器
    JSReadingViewController *readingVC = [[JSReadingViewController alloc] init];
    [self setupVC:readingVC title:@"订阅"];
    // 1.3.图片控制器
    JSPhotoViewController *photoVC = [[JSPhotoViewController alloc] init];
    [self setupVC:photoVC title:@"图片"];
    // 1.4.视频控制器
    JSVideoViewController *videoVC = [[JSVideoViewController alloc] init];
    [self setupVC:videoVC title:@"视频"];
    // 1.5.评论控制器
    JSCommentViewController *commentVC = [[JSCommentViewController alloc] init];
    [self setupVC:commentVC title:@"跟帖"];
    // 1.6.电台控制器
    JSRadioViewController *radioVC = [[JSRadioViewController alloc] init];
    [self setupVC:radioVC title:@"电台"];
    
    // 2.添加左侧菜单
    JSLeftMenu *leftMenu = [[JSLeftMenu alloc] init];
    leftMenu.delegate = self;
    leftMenu.height = 500;
    leftMenu.width = 200;
    leftMenu.y = 60;
    // 插到背景图上面
    [self.view insertSubview:leftMenu atIndex:1];
    
}


/**
 初始化控制器

 @param vc      vc
 @param title   title
 */
- (void)setupVC:(UIViewController *)vc title:(NSString *)title {
    
    // 1.背景色
    vc.view.backgroundColor = JSRandomColor;
    
    // 2.标题
    JSTitleView *titleView = [[JSTitleView alloc] init];
    titleView.title = title;
    vc.navigationItem.titleView = titleView;
    
    // 3.设置左右按钮
    vc.navigationItem.leftBarButtonItem = [UIBarButtonItem itemWithImageName:@"top_navigation_menuicon" highImageName:@"" target:self action:@selector(leftMenu)];
    vc.navigationItem.rightBarButtonItem = [UIBarButtonItem itemWithImageName:@"top_navigation_infoicon" highImageName:@"" target:self action:@selector(rightMenu)];
    
    // 4.包装一个导航控制器
    JSNavigationController *nav = [[JSNavigationController alloc] initWithRootViewController:vc];
    [self addChildViewController:nav];
    
}

#pragma mark - 监听导航栏按钮点击
- (void)leftMenu {
    NSLog(@"left");
    
    [UIView animateWithDuration:JSNavShowAnimationDuration animations:^{
        // 取出正在显示的导航控制器的view
        UIView *showingView = self.showingNavigationController.view;
        
        // 缩放比例
        CGFloat navH = JSScreenHeight - 2 * 60;
        CGFloat scale = navH / JSScreenHeight;
        
        // 菜单左边的间距
        CGFloat leftMenuMargin = JSScreenWidth * (1-scale) * 0.5;
        CGFloat translateX = 200 - leftMenuMargin;
        
        CGFloat topMargin = JSScreenHeight * (1-scale) * 0.5;
        CGFloat translateY = topMargin - 60;
        
        // 缩放
        CGAffineTransform scaleForm = CGAffineTransformMakeScale(scale, scale);
        // 平移
        CGAffineTransform translateForm = CGAffineTransformTranslate(scaleForm, translateX / scale, -translateY/scale);
        
        showingView.transform = translateForm;
        
        // 添加一个遮盖
        UIButton *cover = [[UIButton alloc] init];
        [cover addTarget:self action:@selector(coverClick:) forControlEvents:UIControlEventTouchUpInside];
        cover.frame = showingView.bounds;
        [showingView addSubview:cover];
    }];
}

- (void)coverClick:(UIButton *)cover {
    [UIView animateWithDuration:0.25 animations:^{
        self.showingNavigationController.view.transform = CGAffineTransformIdentity;
    } completion:^(BOOL finished) {
        // 移除遮盖
        [cover removeFromSuperview];
    }];
}

- (void)rightMenu {
    NSLog(@"right");
}

#pragma mark - JSLeftMenuDelegate
- (void)leftMenu:(JSLeftMenu *)menu didSelectButtonFromIndex:(NSInteger)fromIndex toIndex:(NSInteger)toIndex {
    // 1.移除旧控制器的view
    JSNavigationController *oldNav = self.childViewControllers[fromIndex];
    [oldNav.view removeFromSuperview];
    
    // 2.显示新控制器的view
    JSNavigationController *newNav = self.childViewControllers[toIndex];
    newNav.view.transform = oldNav.view.transform;
    newNav.view.layer.shadowColor = [UIColor blackColor].CGColor;
    newNav.view.layer.shadowOffset = CGSizeMake(-3, 0);
    newNav.view.layer.shadowOpacity = 0.2;
    [self.view addSubview:newNav.view];
    
    // 3.设置当前正在显示的控制器
    self.showingNavigationController = newNav;
    
    [UIView animateWithDuration:JSNavShowAnimationDuration animations:^{
        newNav.view.transform = CGAffineTransformIdentity;
    }];
}


@end
