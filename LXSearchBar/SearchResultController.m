
//
//  SearchResultController.m
//  LXSearchBar
//
//  Created by zhongzhi on 2017/6/19.
//  Copyright © 2017年 zhongzhi. All rights reserved.
//

#import "SearchResultController.h"

@interface SearchResultController ()

@end

@implementation SearchResultController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    UIView *view =[UIView new];
    self.navigationItem.leftBarButtonItem =[[UIBarButtonItem alloc]initWithCustomView:view];
    

    [self searchBarShouldBeginEditing:self.searchBar];
    [self.searchBar becomeFirstResponder];
    self.navigationItem.titleView = self.searchBar;
}

-(void)searchBarCancelButtonClicked:(UISearchBar *)searchBar{
    searchBar.showsCancelButton = NO;
    [searchBar resignFirstResponder];
    
    [self.navigationController popViewControllerAnimated:NO];
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
