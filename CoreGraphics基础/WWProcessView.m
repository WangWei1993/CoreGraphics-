//
//  WWProcessView.m
//  直线、矩形、圆、弧的绘制和进度条绘制
//
//  Created by 王伟 on 2017/4/17.
//  Copyright © 2017年 王伟. All rights reserved.
//

#import "WWProcessView.h"

@interface WWProcessView ()

@property (weak, nonatomic) UILabel *processL;

@end

@implementation WWProcessView


#pragma mark -
#pragma mark - 输入进程
- (void)setProcessValue:(CGFloat)processValue {
    
    // 换算成百分比
    _processValue = processValue;
    
    self.processL.text = [NSString stringWithFormat:@"%0.2f%%",processValue * 100];
    [self.processL sizeToFit];
    
    // 重绘（重新调用drawRect：方法）
    [self setNeedsDisplay];
}

#pragma mark -
#pragma mark - 初始化
- (instancetype)init {
    self = [super init];
    if (self) {
        [self addChildView];
    }
    
    return self;

}

- (void)awakeFromNib {
    [super awakeFromNib];
    [self addChildView];
}

#pragma mark -
#pragma mark - 添加子控件和子控件布局
- (void)addChildView {
    // 添加子控件
    UILabel *processL = [[UILabel alloc] init];
    processL.text = @"0.00%%";
    processL.backgroundColor = [UIColor clearColor];
    self.processL = processL;
    [self addSubview:processL];
}

- (void)layoutSubviews {
    // 布局子控件
    self.processL.frame = CGRectMake(0, 0, self.processL.frame.size.width, self.processL.frame.size.height);
    self.processL.center = CGPointMake(self.bounds.size.width * 0.5, self.bounds.size.height * 0.5);
}


#pragma mark -
#pragma mark - 绘制进度条
- (void)drawRect:(CGRect)rect {

    // 直线
    //[self drawLineRect:rect];
    
    // 折线（拐角处理）
    //[self drawLineLineRect:rect];
    
    // 矩形\圆角矩形
    //[self drawRectRect:rect];
    
    // 圆形\椭圆
    //[self drawOvalInRect:rect];
    
    // 曲线 (由控制点进行控制)
    [self drawQuadCurveRect:rect];

    // 扇形
    //[self drawFanRect:rect];
    
    // 进度条
    //[self drawProcessViewRect:rect];
    
    // 饼图
    //[self drawPieRect:rect];
    
    
}

// 直线
- (void)drawLineRect:(CGRect)rect {
    // 1获取图形上下文
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    
    // 2绘制path
    UIBezierPath *path = [UIBezierPath bezierPath];
    [path moveToPoint:CGPointMake(10, 100)];
    [path addLineToPoint:CGPointMake(50, 200)];
    
    // 设置上下文状态
    CGContextSetLineWidth(ctx, 10);// 设置宽度
    [[UIColor redColor] setStroke];
    
    // 3将path保存到上下文
    CGContextAddPath(ctx, path.CGPath);
    
    // 4将图形上线文渲染在此View的Layer
    CGContextStrokePath(ctx);
}

// 折线
- (void)drawLineLineRect:(CGRect)rect {
    //
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    
    UIBezierPath *path = [UIBezierPath bezierPath];
    [path moveToPoint:CGPointMake(10, 100)];
    [path addLineToPoint:CGPointMake(100, 100)];
    [path addLineToPoint:CGPointMake(10, 195)];
    
    // 设置图形上下文的状态
    // 1设置颜色
    [[UIColor redColor] set];
    
    // 2设置宽度
    CGContextSetLineWidth(ctx, 10);
    
    // 3折角样式
    CGContextSetLineJoin(ctx, kCGLineJoinRound);
    
    // 4顶角样式
    CGContextSetLineCap(ctx, kCGLineCapRound);
    
    // 将path添加到图形上下文中
    CGContextAddPath(ctx, path.CGPath);
    
    // 将图形上下文渲染到Layer上
    CGContextStrokePath(ctx);
}

// 矩形
- (void)drawRectRect:(CGRect)rect {
    //
    // 1绘制线路
    /*
     UIBezierPath *path = [UIBezierPath bezierPathWithRect:CGRectMake(50, 50, 100, 100)];
     [path setLineWidth:10];
     [path setLineJoinStyle:kCGLineJoinRound];
     [[UIColor redColor] set];
     [path stroke]
     */
    
    UIBezierPath *path = [UIBezierPath bezierPathWithRoundedRect:CGRectMake(50, 50, 100, 100) cornerRadius:10];
    [path setLineWidth:10];
    [path stroke];
    
    // 2渲染
    [path fill];
}

// 圆形
- (void)drawOvalInRect:(CGRect)rect {
    UIBezierPath *path = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(rect.size.width * 0.5, rect.size.height * 0.5, rect.size.width * 0.5, rect.size.width * 0.5)];
    [[UIColor redColor] set];
    [path setLineWidth:10];
    
    // 实心圆
    [path fill];
    // 空心圆
    [path stroke];
}

// 曲线
- (void)drawQuadCurveRect:(CGRect)rect {
    // 1 获取图形上下文
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    // 2 画线路
    UIBezierPath *path = [UIBezierPath bezierPath];
    [path moveToPoint:CGPointMake(10, 100)];
    
    // 添加曲线的终点个控制点
    [path addQuadCurveToPoint:CGPointMake(100, 100) controlPoint:CGPointMake(60, 0)];
    
    CGContextSetLineWidth(ctx, 10);
    
    // 3 将线路添加到图形上下文中
    CGContextAddPath(ctx, path.CGPath);
    
    // 4 将图形上下文渲染到View的layer上
    CGContextStrokePath(ctx);
    
}

// 扇形
- (void)drawFanRect:(CGRect)rect {
    CGPoint centerPoint = CGPointMake(rect.size.width * 0.5, rect.size.height * 0.5);
    CGFloat radius = 100;
    CGFloat startAngle = 0;
    CGFloat endAngle = M_PI_2;
    BOOL clockwise = YES;
    
    UIBezierPath *path = [UIBezierPath bezierPathWithArcCenter:centerPoint radius:radius startAngle:startAngle endAngle:endAngle clockwise:clockwise];
    
    [path addLineToPoint:centerPoint];
    
    [[UIColor redColor] set];
    
    // [path closePath];
    
    [path fill];
}

// 进度条
- (void)drawProcessViewRect:(CGRect)rect {

    CGContextRef ctx = UIGraphicsGetCurrentContext();
    
    // 2绘制path
    CGPoint centerPoint = CGPointMake(rect.size.width * 0.5, rect.size.height * 0.5);
    CGFloat radius = rect.size.width * 0.4;
    CGFloat startAngle = -M_PI_2;
    CGFloat endAngle = startAngle + M_PI * 2 * _processValue;
    BOOL clockwise = YES;
    UIBezierPath *path = [UIBezierPath bezierPathWithArcCenter:centerPoint radius:radius startAngle:startAngle endAngle:endAngle clockwise:clockwise];
    
    // 设置图形上下文参数
    CGContextSetLineWidth(ctx, 10);
    
    // 3将path添加到图形上下文
    CGContextAddPath(ctx, path.CGPath);
    
    // 4渲染图形上下文到View的Layer
    CGContextStrokePath(ctx);
}

// 扇形
- (void)drawPieRect:(CGRect)rect {
    // 设定服务器传进的数组
    NSArray *dataArr = @[@23,@25,@12,@13,@10,@17];
    
    CGPoint centerPoint = CGPointMake(rect.size.width * 0.5, rect.size.height * 0.5);
    CGFloat radius = rect.size.width * 0.4; // 半径
    CGFloat startAngle = 0;// 开始角度
    CGFloat angle = 0;     // 角度变化值
    CGFloat endAngle = 0;  // 结束角度
    BOOL clockwise = YES;  // 是否是顺时针
    
    for (NSNumber *num in dataArr) {
        
        startAngle = endAngle;
        
        angle = num.integerValue / 100.0 * M_PI * 2;
        
        endAngle = startAngle + angle;
        
        UIBezierPath *path = [UIBezierPath bezierPathWithArcCenter:centerPoint radius:radius startAngle:startAngle endAngle:endAngle clockwise:clockwise];
        
        // 将终点都连接到中心点
        [path addLineToPoint:centerPoint];
        
        
        [[self randomColor] set];
        
        [path fill];
        
    }
    
}

//随机颜色
- (UIColor *)randomColor{
    
    CGFloat r = arc4random_uniform(256) / 255.0;
    CGFloat g = arc4random_uniform(256) / 255.0;
    CGFloat b = arc4random_uniform(256) / 255.0;
    
    //根据RGB值,返回一个颜色,RGB颜色取值范围是0-255.
    //它的RGB数值取值范围是0-1.
    //alpha:透明度
    return [UIColor colorWithRed:r green:g blue:b alpha:1];
}


@end
