//
//  UIImage+JSExtension.h
//  NetEaseNews
//
//  Created by leo on 20/10/2016.
//  Copyright © 2016 leo. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (JSExtension)


/**
 返回一个纯颜色图片，颜色变图片

 @param color color

 @return image
 */
+ (UIImage *)imageWithColor:(UIColor *)color;

@end
