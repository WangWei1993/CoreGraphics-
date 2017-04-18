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

- (UIImage *)setWaterMark {
    
    // 1创建一个位图上下文.
    //size:要开启一个多大的图片上下文.
    //opaque:不透明度,当为YES为不透明, 为NO的时候透明,
    //scale:是否需要缩放.
    UIGraphicsBeginImageContextWithOptions(self.size, NO, 0);
    
    // 2将水印添加到上下文中
    [self drawAtPoint:CGPointZero];
    
    // 3绘制水印
    CGPoint point = CGPointMake(0, self.size.height - 20);
    [_str drawAtPoint:point withAttributes:nil];
    
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    
    // 4关闭图片上下文
    UIGraphicsEndImageContext();
    
    // 生成image
    return newImage;
    
}

@end
