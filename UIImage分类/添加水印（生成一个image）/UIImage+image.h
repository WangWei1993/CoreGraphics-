//
//  UIImage+image.h
//  添加水印（生成一个image）
//
//  Created by 王伟 on 2017/4/18.
//  Copyright © 2017年 王伟. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (image)



#pragma mark -
#pragma mark - 加水印

/**
 *  制作水印
 */
+ (UIImage *)imageWaterMarkWithImage:(UIImage *)image;




#pragma mark -
#pragma mark - 将图片剪切成：圆形图片、带边框的圆形图片、带边框的矩形图片、圆角图片

/**
 *  圆形图片
 */
+ (UIImage *)imageClipRoundWithImage:(UIImage *)image;

/**
 *  带边框的图片
 */
+ (UIImage *)imageClipRoundWithImage:(UIImage *)image borderWidth:(CGFloat)borderWidth borderColor:
(UIColor *)borderColor;

/**
 *   带边框的矩形图片
 */
+ (UIImage *)imageRoundedRectWithImage:(UIImage *)image borderWidth:(CGFloat)borderWidth borderColor:(UIColor *)borderColor cornerRadius:(CGFloat)cornerRadius;

/**
 *  圆角图片
 */
+ (UIImage *)imageRoundedRectWithImage:(UIImage *)image cornerRadius:(CGFloat)cornerRadius;




#pragma mark -
#pragma mark - 截图

/**
 *  将View区域截图
 */
+ (UIImage *)imageRenderImageWithView:(UIView *)view;

/**
 *  将View区域截图，并且返回NSData（RNG
 */
+ (NSData *)imageRenderRNGWithView:(UIView *)view;

/**
 *  将View区域截图，并且返回NSData（JPEG）
 */
+ (NSData *)imageRenderJPEGWithView:(UIView *)view compressionQuality:(CGFloat)compressionQuality;


@end
