//
//  DrawView.m
//  UIKit的绘图
//
//  Created by 王伟 on 2017/4/18.
//  Copyright © 2017年 王伟. All rights reserved.
//

#import "DrawView.h"

@implementation DrawView

- (void)drawRect:(CGRect)rect {
    
    // 无论是画图片还是画文字都得要在drawRect方法当中才能绘制. 它们的底层也都是需要获取上下文的.
    
    // 画文字
    
    // 画图片
    
    // 画个矩形（这个方法必须要在drawRect方法中才能实现，原因和[path stroke]的实现一样都需要在此方法内获取图形上下文）
    
    // 实现系统UIImageView的功能
    
    
}

// 画图片
- (void)drawImageRect:(CGRect)rect {
    //UIImage *image = [UIImage imageNamed:@"黄人"];
    
    
    /*
     kCGBlendModeNormal,
     
     kCGBlendModeMultiply,
     kCGBlendModeScreen,
     kCGBlendModeOverlay,
     
     kCGBlendModeDarken,
     kCGBlendModeLighten,
     kCGBlendModeColorDodge,
     
     kCGBlendModeColorBurn,
     kCGBlendModeSoftLight,
     kCGBlendModeHardLight,
     
     kCGBlendModeDifference,
     kCGBlendModeExclusion,
     kCGBlendModeHue,
     
     kCGBlendModeSaturation,
     kCGBlendModeColor,
     kCGBlendModeLuminosity,
     */
    // [image drawInRect:rect blendMode:kCGBlendModeNormal alpha:1];
    
    
    // 超过这个的话就需要截取
    // UIRectClip(CGRectMake(0, 0, 100, 100));
    
    // 按照图片的大小画(图片过大过小会导致显示的效果不佳)
    //[image drawAtPoint:CGPointMake(0, 0)];
    
    // 按照给的View的大小画(会造成拉升)
    // [image drawInRect:rect];
    
    
    UIImage *image = [UIImage imageNamed:@"001"];
    
    // Pattern（平铺绘制）
    [image drawAsPatternInRect:rect];
}


// 画文字
- (void)drawStringRect:(CGRect)rect {
    NSString *str = [NSString stringWithFormat:@"厉害了厉害了厉害了厉害了"];
    NSMutableDictionary *mutiDic = [NSMutableDictionary dictionary];
    // font
    mutiDic[NSFontAttributeName] = [UIFont fontWithName:@"Helvetica-Bold" size:40];
    // color
    mutiDic[NSForegroundColorAttributeName] = [UIColor redColor];
    // shadow
    NSShadow *shadow = [[NSShadow alloc] init];
    shadow.shadowColor = [UIColor blackColor];
    shadow.shadowOffset = CGSizeMake(-10, 10);
    shadow.shadowBlurRadius = 1;
    mutiDic[NSShadowAttributeName] = shadow;
    
    // 如果要设置shadow属性，那么需要设置StrokeColor才能生效
    mutiDic[NSStrokeColorAttributeName] = [UIColor clearColor];
    // mutiDic[NSStrokeWidthAttributeName] = @2;
    
    [str drawInRect:rect withAttributes:mutiDic];// 可以换行
    // [str drawAtPoint:CGPointMake(0, 0) withAttributes:mutiDic];// 不会换行
}


@end
