//
//  JSLeftMenu.m
//  NetEaseNews
//
//  Created by leo on 20/10/2016.
//  Copyright © 2016 leo. All rights reserved.
//

#import "JSLeftMenu.h"

@implementation JSLeftMenu

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        //
        [self setBtnWithIcon:@"sidebar_nav_news" title:@"新闻"];
        [self setBtnWithIcon:@"sidebar_nav_reading" title:@"订阅"];
        [self setBtnWithIcon:@"sidebar_nav_photo" title:@"图片"];
        [self setBtnWithIcon:@"sidebar_nav_video" title:@"视频"];
        [self setBtnWithIcon:@"sidebar_nav_comment" title:@"跟帖"];
        [self setBtnWithIcon:@"sidebar_nav_radio" title:@"电台"];
    }
    return self;
}


/**
 添加按钮

 @param icon  图标
 @param title 标题

 @return button
 */
- (UIButton *)setBtnWithIcon:(NSString *)icon title:(NSString *)title {
    UIButton *btn = [[UIButton alloc] init];
    [btn setImage:[UIImage imageNamed:icon] forState:UIControlStateNormal];
    [btn setTitle:title forState:UIControlStateNormal];
    [btn setTintColor:[UIColor whiteColor]];
    btn.titleLabel.font = [UIFont systemFontOfSize:17];
    
    btn.adjustsImageWhenHighlighted = NO;
    
    // 设置间距
    btn.titleEdgeInsets = UIEdgeInsetsMake(0, 10, 0, 0);
    
    [self addSubview:btn];
    
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

@end
