//
//  NextController.m
//  LXSearchBar
//
//  Created by zhongzhi on 2017/6/19.
//  Copyright © 2017年 zhongzhi. All rights reserved.
//

#import "NextController.h"
#import "SearchResultController.h"
@interface NextController ()

@end

@implementation NextController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self.view addSubview:self.searchBar];
    
    
}
-(BOOL)searchBarShouldBeginEditing:(UISearchBar *)searchBar{

    
    SearchResultController *nextVc =[[SearchResultController alloc]init];
    
    CATransition* transition = [CATransition animation];
    transition.duration = 0.3;
    transition.type = kCATransitionFade;            //改变视图控制器出现的方式
    
    transition.subtype = kCATransitionFromTop;     //出现的位置
    
    [self.navigationController.view.layer addAnimation:transition forKey:kCATransition];
    
    [self.navigationController pushViewController:nextVc animated:NO];
    
    
    return YES;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
