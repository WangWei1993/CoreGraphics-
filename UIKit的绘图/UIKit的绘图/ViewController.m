//
//  ViewController.m
//  UIKit的绘图
//
//  Created by 王伟 on 2017/4/18.
//  Copyright © 2017年 王伟. All rights reserved.
//

#import "ViewController.h"
#import "DrawView.h"
#import "WWImageView.h"


@interface ViewController ()

@property (strong, nonatomic) IBOutlet DrawView *drawView;
@property (weak, nonatomic) WWImageView *imageView;

@end

@implementation ViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];

    
    // 1. UIImageView
    WWImageView *imageV = [[WWImageView alloc] init];
    imageV.image = [UIImage imageNamed:@"阿狸头像"];
    imageV.frame = CGRectMake(0, 0, 100, 100);
    [self.view addSubview:imageV];

    
    // 2. UIImageView显示的图片尺寸是image的图片的真实尺寸
//    WWImageView *imageV = [[WWImageView alloc] initWithImage:[UIImage imageNamed:@"阿狸头像"]];
//    imageV.center = self.view.center;
//    [self.view addSubview:imageV];
    
}

/*
 UIViewContentModeScaleToFill,
 UIViewContentModeScaleAspectFit,      // contents scaled to fit with fixed aspect. remainder is transparent
 UIViewContentModeScaleAspectFill,     // contents scaled to fill with fixed aspect. some portion of content may be clipped.
 UIViewContentModeRedraw,              // redraw on bounds change (calls -setNeedsDisplay)
 UIViewContentModeCenter,              // contents remain same size. positioned adjusted.
 UIViewContentModeTop,
 UIViewContentModeBottom,
 UIViewContentModeLeft,
 UIViewContentModeRight,
 UIViewContentModeTopLeft,
 UIViewContentModeTopRight,
 UIViewContentModeBottomLeft,
 UIViewContentModeBottomRight,
 
 imageV.contentMode =
 */

/*
 
UIImageView *imageV = [[UIImageView alloc] init];
imageV.image = [UIImage imageNamed:@"阿狸头像"];
imageV.frame = CGRectMake(0, 0, 100, 100);
[self.view addSubview:imageV];


 */


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
