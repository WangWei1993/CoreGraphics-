//
//  ViewController.m
//  直线、矩形、圆、弧的绘制和进度条绘制
//
//  Created by 王伟 on 2017/4/17.
//  Copyright © 2017年 王伟. All rights reserved.
//

#import "ViewController.h"
#import "WWProcessView.h"

@interface ViewController ()

@property (strong, nonatomic) IBOutlet WWProcessView *contextView;

@property (strong, nonatomic) IBOutlet UISlider *sliderView;


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    
}
- (IBAction)process:(UISlider *)sender {
    
    self.contextView.processValue = sender.value;
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
