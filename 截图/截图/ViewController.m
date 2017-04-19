//
//  ViewController.m
//  截图
//
//  Created by 王伟 on 2017/4/19.
//  Copyright © 2017年 王伟. All rights reserved.
//

#import "ViewController.h"

@interface ViewController () <UITableViewDelegate, UITableViewDataSource>

@property (strong, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.tableView reloadData];
    
    // 将tableView里面的内容截图下来看看
    NSData *imageData = [self imageRenderJPEGWithView:self.tableView];
    
    [imageData writeToFile:@"/Users/---/Desktop/tableViewImage.jpg" atomically:YES];
    
   
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    // 1.从缓存池中取ID表示的Cell
    static NSString *ID = @"bannerV";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
    }
    
    cell.textLabel.text = [NSString stringWithFormat:@"-----%ld",(long)indexPath.row];
    // 3.返回cell
    return cell;

}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 44;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
