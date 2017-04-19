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

#pragma mark -
#pragma mark - 加水印
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

#pragma mark -
#pragma mark - 将图片剪切成：圆形图片、带边框的圆形图片、带边框的矩形图片、圆角图片
// 圆形图片
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

// 带边框的圆形图片
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

// 带边框的矩形图片
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

// 圆角图片
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

#pragma mark -
#pragma mark - 截图
// 将View区域截图
+ (UIImage *)imageRenderImageWithView:(UIView *)view {
    
    if ([view isKindOfClass:[UIScrollView class]]) {
        
        UIScrollView *scrollView = (UIScrollView *)view;
        
        // 保存scrollView的基本属性
        CGRect saveFrame = scrollView.frame;
        CGPoint saveOrigin = scrollView.contentOffset;
        
        scrollView.frame = CGRectMake(0, scrollView.frame.origin.y, scrollView.contentSize.width, scrollView.contentSize.height);
        
        
        // 开启位图上下层
        UIGraphicsBeginImageContext(scrollView.contentSize);
        
        // 获取位图上下层
        CGContextRef ctx = UIGraphicsGetCurrentContext();
        
        // 将tableView渲染到上下层中
        [scrollView.layer renderInContext:ctx];
        
        // 从上下层中获取图片
        UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
        
        scrollView.frame = saveFrame;
        scrollView.contentOffset = saveOrigin;
        
        return image;
        
    } else {
        
        // 开启位图上下层
        UIGraphicsBeginImageContext(view.frame.size);
        
        // 获取位图上下层
        CGContextRef ctx = UIGraphicsGetCurrentContext();
        
        // 将tableView渲染到上下层中
        [view.layer renderInContext:ctx];
        
        // 从上下层中获取图片
        UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
        
        return image;
    }
}

// 将View区域截图，并且返回NSData（RNG）
+ (NSData *)imageRenderRNGWithView:(UIView *)view {
    
    // 获取截图
    UIImage *image = [self imageRenderImageWithView:view];
    
    // 将image转成NSData
    NSData *imageData = UIImagePNGRepresentation(image);
    
    return imageData;
}

// 将View区域截图，并且返回NSData（JPEG）
+ (NSData *)imageRenderJPEGWithView:(UIView *)view compressionQuality:(CGFloat)compressionQuality {
    
    // 获取截图
    UIImage *image = [self imageRenderImageWithView:view];
    
    // 将image转成NSData
    NSData *imageData = UIImageJPEGRepresentation(image, compressionQuality);
    
    return imageData;
}



@end
