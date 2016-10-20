//
//  UIImage+JSExtension.m
//  NetEaseNews
//
//  Created by leo on 20/10/2016.
//  Copyright © 2016 leo. All rights reserved.
//

#import "UIImage+JSExtension.h"

@implementation UIImage (JSExtension)

/**
 返回一个纯颜色图片，颜色变图片
 
 @param color color
 
 @return image
 */
+ (UIImage *)imageWithColor:(UIColor *)color {
    CGFloat imageW = 100;
    CGFloat imageH = 100;
    // 1.开启图形上下文
    UIGraphicsBeginImageContextWithOptions(CGSizeMake(imageW, imageH), NO, 0);
    
    // 2.画一个color颜色的矩形框
    [color set];
    UIRectFill(CGRectMake(0, 0, imageW, imageH));
    
    // 3.拿到图片
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    
    // 4.关闭上下文
    UIGraphicsEndImageContext();
    
    return image;
}

@end
