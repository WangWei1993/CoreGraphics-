//
//  UIImage+image.m
//  添加水印（生成一个image）
//
//  Created by 王伟 on 2017/4/18.
//  Copyright © 2017年 王伟. All rights reserved.
//

#import "UIImage+image.h"

@implementation UIImage (image)

static NSString *_str = @"@故事的小黄花";

// 整个水印
+ (UIImage *)imageWaterMarkWithImage:(UIImage *)image {
    
    // 1创建一个位图上下文.
    //size:要开启一个多大的图片上下文.
    //opaque:不透明度,当为YES为不透明, 为NO的时候透明,
    //scale:是否需要缩放.
    UIGraphicsBeginImageContextWithOptions(image.size, NO, 0);
    
    // 2将水印添加到上下文中
    [image drawAtPoint:CGPointZero];
    
    // 3绘制水印
    CGPoint point = CGPointMake(0, image.size.height - 20);
    [_str drawAtPoint:point withAttributes:nil];
    
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    
    // 4关闭图片上下文
    UIGraphicsEndImageContext();
    
    // 生成image
    return newImage;
}

// 将图片正常圆形图片
+ (UIImage *)imageClipRoundWithImage:(UIImage *)image {
    
    //1开启一个和图片一样大小的位图上下文
    UIGraphicsBeginImageContextWithOptions(image.size, NO, 0);
    //2制作圆形剪切区域
    UIBezierPath *clipPath = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(0, 0, image.size.width, image.size.height)];
    [clipPath addClip];
    //3将image画到上下文中
    [image drawAtPoint:CGPointZero];
    //4从当前位图上下文中生成图片
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    //5关闭位图上下层
    UIGraphicsEndImageContext();
    
    return newImage;
}

// 将图片转成带边框的圆形图片
+ (UIImage *)imageClipRoundWithImage:(UIImage *)image borderWidth:(CGFloat)borderWidth borderColor:(UIColor *)borderColor {
    
    CGFloat borderW = borderWidth;
    
    //1开启一个和图片一样大小的位图上下文
    UIGraphicsBeginImageContextWithOptions(image.size, NO, 0);
    
    // 2画一个圆到上下文
    UIBezierPath *borderPath = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(0, 0, image.size.width , image.size.height)];
    [borderColor set];
    // 获取上下文,进而添加path到上下文，进而fill画出圆
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    CGContextAddPath(ctx, borderPath.CGPath);
    CGContextFillPath(ctx);
    
    
    //3制作圆形剪切区域
    UIBezierPath *clipPath = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(borderW, borderW, image.size.width - borderW * 2, image.size.height - borderW * 2)];
    [clipPath addClip];
    //4将image画到上下文中
    [image drawAtPoint:CGPointZero];
    //5从当前位图上下文中生成图片
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    //6关闭位图上下层
    UIGraphicsEndImageContext();
    
    return newImage;
}

// 将图片转成带边框的矩形图片
+ (UIImage *)imageRoundedRectWithImage:(UIImage *)image borderWidth:(CGFloat)borderWidth borderColor:(UIColor *)borderColor cornerRadius:(CGFloat)cornerRadius {
    
    //1开启一个和图片一样大小的位图上下文
    UIGraphicsBeginImageContextWithOptions(image.size, NO, 0);
    
    // 2画一个圆到上下文
    UIBezierPath *borderPath = [UIBezierPath bezierPathWithRoundedRect:CGRectMake(0, 0, image.size.width, image.size.height) cornerRadius:cornerRadius];
    // [borderColor set];
    // 获取上下文,进而添加path到上下文，进而fill画出圆
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    CGContextAddPath(ctx, borderPath.CGPath);
    CGContextFillPath(ctx);
    
    
    //3制作圆形剪切区域
    UIBezierPath *clipPath = [UIBezierPath bezierPathWithRoundedRect:CGRectMake(borderWidth, borderWidth, image.size.width - borderWidth * 2, image.size.height - borderWidth * 2) cornerRadius:cornerRadius];
    [clipPath addClip];
    //4将image画到上下文中
    [image drawAtPoint:CGPointZero];
    //5从当前位图上下文中生成图片
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    //6关闭位图上下层
    UIGraphicsEndImageContext();
    
    return newImage;
}

// 将图片改成圆角图片
+ (UIImage *)imageRoundedRectWithImage:(UIImage *)image cornerRadius:(CGFloat)cornerRadius {
    
    //1开启一个和图片一样大小的位图上下文
    UIGraphicsBeginImageContextWithOptions(image.size, NO, 0);
    
    //2配置矩形剪切范围
    UIBezierPath *rectPath = [UIBezierPath bezierPathWithRoundedRect:CGRectMake(0, 0, image.size.width, image.size.height) cornerRadius:cornerRadius];
    [rectPath addClip];
    
    //4将image画到上下文中
    [image drawAtPoint:CGPointZero];
    //5从当前位图上下文中生成图片
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    //6关闭位图上下层
    UIGraphicsEndImageContext();
    
    return newImage;
}


@end
