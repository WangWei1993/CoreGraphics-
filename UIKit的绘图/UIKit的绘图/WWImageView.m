//
//  WWImageView.m
//  UIKit的绘图
//
//  Created by 王伟 on 2017/4/18.
//  Copyright © 2017年 王伟. All rights reserved.
//

#import "WWImageView.h"



@implementation WWImageView

- (instancetype)initWithImage:(UIImage *)image {
    
    self = [super init];
    if (self) {
        
        self.frame = CGRectMake(0, 0, image.size.width, image.size.height);
        
        _image = image;
        // 重绘
        [self setNeedsDisplay];
    }
    return self;
    
}

// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
    
    [_image drawInRect:rect];
    
    
}


@end
