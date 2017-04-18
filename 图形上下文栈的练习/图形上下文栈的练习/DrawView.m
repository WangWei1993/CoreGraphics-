//
//  DrawView.m
//  图形上下文栈的练习
//
//  Created by 王伟 on 2017/4/18.
//  Copyright © 2017年 王伟. All rights reserved.
//

#import "DrawView.h"

@implementation DrawView


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
    
    // 主要针对图形上下文的状态进行保留
    //上下文状态栈.
    //用来保存当前上下文当中的状态.
    //使用CGContextSaveGState就会将当前的上下文保存到上下文状态栈中.
    //使用GContextRestoreGState取出一个状态.
    
    
    
    
    // 获取当前的图形上下文
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    
    // 画路径
    UIBezierPath *path = [UIBezierPath bezierPath];
    //设置起点
    [path moveToPoint:CGPointMake(10, 150)];
    //添加一条线到某个点
    [path addLineToPoint:CGPointMake(290, 150)];


    // 保存当前上下文保存到上下文栈中
    CGContextSaveGState(ctx);
    
    // 修改上下文的状态
    CGContextSetLineWidth(ctx, 10);
    [[UIColor redColor] set];
    
    // 将路径添加到上下文中
    CGContextAddPath(ctx, path.CGPath);
    CGContextStrokePath(ctx);
    
    
    path = [UIBezierPath bezierPath];
    [path moveToPoint:CGPointMake(150, 10)];
    //添加一条线到某个点
    [path addLineToPoint:CGPointMake(150, 290)];
    
    // 从上下文栈中获取一个上下文
    CGContextRestoreGState(ctx);
    
    // 将路径添加到上下文中
    CGContextAddPath(ctx, path.CGPath);
    CGContextStrokePath(ctx);
    
}


@end
