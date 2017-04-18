//
//  WWImageView.h
//  UIKit的绘图
//
//  Created by 王伟 on 2017/4/18.
//  Copyright © 2017年 王伟. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WWImageView : UIView

/** <#name#> */
@property (nonatomic, strong) UIImage *image;

- (instancetype)initWithImage:(UIImage *)image;

@end
