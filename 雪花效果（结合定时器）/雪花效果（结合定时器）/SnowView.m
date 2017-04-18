//
//  SnowView.m
//  雪花效果（结合定时器）
//
//  Created by 王伟 on 2017/4/18.
//  Copyright © 2017年 王伟. All rights reserved.
//

#import "SnowView.h"

@implementation SnowView

static CGFloat _snowY = 0;

- (void)awakeFromNib {
    [super awakeFromNib];
    
    // 开启定时器
    [self startTimer];
}

- (void)startTimer {

    //我们在绘制的时候使用定时器最好使用CADisplayLink.
    //创建CADisplayLink定时器
    //这个定时器方法它是当每次屏幕刷新的时候调用(屏幕每一秒刷新60次);
    //如果我们使用NSTimer定时器. 设置的执行时间为0.025秒,
    //如果屏幕刷新时间为0.035.中间就会等待0.010;
    
    // 这种方式会出现卡顿
    // [NSTimer scheduledTimerWithTimeInterval:0.1 target:self selector:@selector(changeSnowY) userInfo:nil repeats:YES];
    
    //使用CADisplayLink不需要考虑时间间隔.
    CADisplayLink *link = [CADisplayLink displayLinkWithTarget:self selector:@selector(changeSnowY)];
    
    // 需要将定时器添加到循环中才能启动这个定时器
    [link addToRunLoop:[NSRunLoop mainRunLoop] forMode:NSRunLoopCommonModes];
    
}

- (void)changeSnowY {

    _snowY += 1;
    if (_snowY >= CGRectGetMaxY(self.frame)) {
        _snowY = 0;
    }
    
    
    //修改完毕做一次重绘
    //setNeedsDisplay:这个方法底层会调用drawRect方法, 但是它并不是立马调用的, 它只是设了一个标志.它会等到下一次屏幕刷新的时候再去调用drawRect.
    [self setNeedsDisplay];
}

// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
    
    UIImage *image = [UIImage imageNamed:@"花"];
    [image drawAtPoint:CGPointMake(0, _snowY)];
    
    
}


@end
