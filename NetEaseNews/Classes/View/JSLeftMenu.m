//
//  JSLeftMenu.m
//  NetEaseNews
//
//  Created by leo on 20/10/2016.
//  Copyright © 2016 leo. All rights reserved.
//

#import "JSLeftMenu.h"

@interface JSLeftMenu ()

/** selectedButton */
@property (nonatomic, weak) UIButton *selectedButton;

@end

@implementation JSLeftMenu

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor clearColor];
        
        CGFloat alpha = 0.2;
        
        UIButton *newsButton = [self setBtnWithIcon:@"sidebar_nav_news" bgColor:JSColorRGBA(202, 68, 73, alpha) title:@"新闻"];
        [self buttonClick:newsButton];
        
        [self setBtnWithIcon:@"sidebar_nav_reading" bgColor:JSColorRGBA(190, 111, 69, alpha) title:@"订阅"];
        [self setBtnWithIcon:@"sidebar_nav_photo" bgColor:JSColorRGBA(76, 132, 190, alpha) title:@"图片"];
        [self setBtnWithIcon:@"sidebar_nav_video" bgColor:JSColorRGBA(101, 170, 78, alpha) title:@"视频"];
        [self setBtnWithIcon:@"sidebar_nav_comment" bgColor:JSColorRGBA(170, 172, 73, alpha) title:@"跟帖"];
        [self setBtnWithIcon:@"sidebar_nav_radio" bgColor:JSColorRGBA(190, 62, 119, alpha) title:@"电台"];
    }
    return self;
}


/**
 添加按钮

 @param icon  图标
 @param bgcolor 背景颜色
 @param title 标题

 @return button
 */

- (UIButton *)setBtnWithIcon:(NSString *)icon bgColor:(UIColor *)bgcolor title:(NSString *)title {
    UIButton *btn = [[UIButton alloc] init];
    [btn addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:btn];
    
    // 设置图片和文字
    [btn setImage:[UIImage imageNamed:icon] forState:UIControlStateNormal];
    [btn setTitle:title forState:UIControlStateNormal];
    [btn setTintColor:[UIColor whiteColor]];
    btn.titleLabel.font = [UIFont systemFontOfSize:17];
    
    // 设置按钮选中的背景
    [btn setBackgroundImage:[UIImage imageWithColor:bgcolor] forState:UIControlStateSelected];
    
    // 设置高亮的时候不要让图标变色
    btn.adjustsImageWhenHighlighted = NO;
    
    // 设置按钮的内容左对齐
    btn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    
    // 设置间距
    btn.titleEdgeInsets = UIEdgeInsetsMake(0, 10, 0, 0);
    btn.contentEdgeInsets = UIEdgeInsetsMake(0, 30, 0, 0);
    
    return btn;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    // 设置按钮的frame
    NSUInteger btnCount = self.subviews.count;
    CGFloat btnWidth = self.width;
    CGFloat btnHeight = self.height / btnCount;
    for (int i = 0; i < btnCount; i++) {
        UIButton *btn = self.subviews[i];
        btn.width = btnWidth;
        btn.height = btnHeight;
        btn.x = 0;
        btn.y = i * btn.height;
    }
    
}

#pragma mark - 监听按钮点击
- (void)buttonClick:(UIButton *)button {
    self.selectedButton.selected = NO;
    button.selected = YES;
    self.selectedButton = button;
}





@end
