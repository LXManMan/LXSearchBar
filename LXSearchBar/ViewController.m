//
//  ViewController.m
//  LXSearchBar
//
//  Created by zhongzhi on 2017/6/19.
//  Copyright © 2017年 zhongzhi. All rights reserved.
//

#import "ViewController.h"
#import "NextController.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.navigationController.navigationBar.translucent = NO;
    self.navigationController.navigationBar.barTintColor = [UIColor hexStringToColor:@"#393d63"];
    self.extendedLayoutIncludesOpaqueBars = YES;
    self.automaticallyAdjustsScrollViewInsets = NO;

   
    
}
-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    NextController *nextVc =[[NextController alloc]init];
    [self.navigationController pushViewController:nextVc animated:YES];
}



@end
