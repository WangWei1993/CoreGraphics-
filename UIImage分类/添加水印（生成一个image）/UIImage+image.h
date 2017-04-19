//
//  UIImage+image.h
//  添加水印（生成一个image）
//
//  Created by 王伟 on 2017/4/18.
//  Copyright © 2017年 王伟. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (image)


/**
 *  制作水印
 */
+ (UIImage *)imageWaterMarkWithImage:(UIImage *)image;


/**
 *  将图片剪切为圆形图片
 */
+ (UIImage *)imageClipRoundWithImage:(UIImage *)image;


/**
 *  将图片转成带边框的图片
 */
+ (UIImage *)imageClipRoundWithImage:(UIImage *)image borderWidth:(CGFloat)borderWidth borderColor:
(UIColor *)borderColor;


/**
 *   将图片转成带边框的矩形图片
 */
+ (UIImage *)imageRoundedRectWithImage:(UIImage *)image borderWidth:(CGFloat)borderWidth borderColor:(UIColor *)borderColor cornerRadius:(CGFloat)cornerRadius;


/**
 *  将图片改成圆角图片
 */
+ (UIImage *)imageRoundedRectWithImage:(UIImage *)image cornerRadius:(CGFloat)cornerRadius;


@end
