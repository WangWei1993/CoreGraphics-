//
//  ViewController.m
//  添加水印（生成一个image）
//
//  Created by 王伟 on 2017/4/18.
//  Copyright © 2017年 王伟. All rights reserved.
//

#import "ViewController.h"
#import "UIImage+image.h"

@interface ViewController ()

@property (strong, nonatomic) IBOutlet UIImageView *imageView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    /*
     1. 位图上下文是需要手动开启和手动关闭
     2. layer的图形上下文可以从drawRect方法中直接获取（系统调用的时候）
     */
    
    // 1  将图片剪切成圆形图片
//     UIImage *image = [UIImage imageNamed:@"阿狸头像"];
//     self.imageView.image = [UIImage imageClipRoundWithImage:image];
    
    // 2  将图片剪切成带框的圆形图片
     UIImage *image = [UIImage imageNamed:@"阿狸头像"];
     self.imageView.image = [UIImage imageClipRoundWithImage:image borderWidth:1.0 borderColor:[UIColor yellowColor]];
    
    // 3  将图片剪切成带框的矩形图片
    //UIImage *image = [UIImage imageNamed:@"阿狸头像"];
    //self.imageView.image = [UIImage imageRoundedRectWithImage:image borderWidth:10 borderColor:[UIColor yellowColor] cornerRadius:10];
    
    // 4  将图片剪切成圆角图片
    //UIImage *image = [UIImage imageNamed:@"阿狸头像"];
    //self.imageView.image = [UIImage imageRoundedRectWithImage:image cornerRadius:10];

    
    // 5  添加水印
    // UIImage *image = [UIImage imageNamed:@"阿狸头像"];
    // self.imageView.image = [UIImage imageWaterMarkWithImage:image];
    
    
    
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
