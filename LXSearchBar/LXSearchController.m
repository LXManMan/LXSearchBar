//
//  LXSearchController.m
//  LXSearchBar
//
//  Created by zhongzhi on 2017/6/19.
//  Copyright © 2017年 zhongzhi. All rights reserved.
//

#import "LXSearchController.h"

@interface LXSearchController ()
@property(nonatomic,strong)UIColor *searchAreaColor;//搜索区域的颜色
@property(nonatomic,copy)NSString *cancelBtnName;//取消按钮的名字
@property(nonatomic,strong)UIColor *canceBtnColor; //取消按钮的颜色
@property(nonatomic,strong)UIColor *backImageviewColor;//背景图的颜色
@property(nonatomic,assign)UIOffset mouseOffSet;//光标位置

@end

@implementation LXSearchController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.navigationController.navigationBar.translucent = NO;
    self.navigationController.navigationBar.barTintColor = [UIColor hexStringToColor:@"#393d63"];
    self.extendedLayoutIncludesOpaqueBars = YES;
    self.automaticallyAdjustsScrollViewInsets = NO;
    self.view.backgroundColor =[UIColor whiteColor];
   
}
-(BOOL)searchBarShouldBeginEditing:(UISearchBar *)searchBar{
    searchBar.showsCancelButton = YES;
    // 然后设置searchBar的tint颜色
    //    [searchBar setBarTintColor:[UIColor whiteColor]];
    for(id cc in [searchBar subviews]){
        for (id subView in [cc subviews]) {
            if ([subView isKindOfClass:[UITextField class]]) {

            }else if([subView isKindOfClass:[UIButton class]]){
                // 修改取消按钮
                UIButton *btn = (UIButton *)subView;
                [btn setTitle:self.cancelBtnName forState:UIControlStateNormal];
                [btn setTitleColor:self.canceBtnColor forState:(UIControlStateNormal)];
            }
        }
    }
    
    return YES;
}

-(UISearchBar *)searchBar{
    if (!_searchBar) {
       _searchBar = [[UISearchBar alloc] initWithFrame:(CGRectMake(0, 64, Device_Width, 40))];
        _searchBar.placeholder = @"姓名/昵称/电话";
        _searchBar.delegate = self;
        // 样式
        _searchBar.tintColor = self.canceBtnColor;
        _searchBar.searchBarStyle = UISearchBarStyleProminent;
        
//        UISearchBar有一个searchTextPositionAdjustment属性就是设置光标偏移量的，类型为UIOffset结构体，赋值即可
        
       //第一个值是水平偏移量，第二个是竖直方向的偏移量
        _searchBar.searchTextPositionAdjustment = self.mouseOffSet;
        // ** 自定义searchBar的样式 **
        UITextField* searchField = nil;
        // 注意searchBar的textField处于孙图层中
//        _searchBar.backgroundColor = ;
        for (UIView* subview  in [_searchBar.subviews firstObject].subviews) {
            NSLog(@"%@", subview.class);
            // 打印出两个结果:
            /*
             UISearchBarBackground
             UISearchBarTextField
             */
            
            if ([subview isKindOfClass:[UITextField class]]) {
                
                searchField = (UITextField*)subview;
                // leftView就是放大镜
                // searchField.leftView=nil;
                // 删除searchBar输入框的背景
                [searchField setBackground:nil];
                [searchField setBorderStyle:UITextBorderStyleNone];
                searchField.backgroundColor = self.searchAreaColor;
                // 设置圆角
                searchField.layer.cornerRadius = 15;
                searchField.layer.masksToBounds = YES;
                break;
            }
            if ([subview isKindOfClass:[NSClassFromString(@"UISearchBarBackground") class]]) {
                UIImageView *backImageView = (UIImageView *)subview;
                
                backImageView.image =[UIImage imageWithColor:[UIColor hexStringToColor:@"dddddd"] size:_searchBar.frame.size];
                    }
            

        }

    }
    return _searchBar;
}
-(void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    self.searchBar.showsCancelButton = NO;
    [ self.searchBar resignFirstResponder];
    [self.view endEditing:YES];
    
}
-(void)searchBarCancelButtonClicked:(UISearchBar *)searchBar{
    searchBar.showsCancelButton = NO;
    [searchBar resignFirstResponder];
    
}
-(UIColor *)searchAreaColor{
    if (!_searchAreaColor) {
        _searchAreaColor =[UIColor hexStringToColor:@"F0EFF5"];
    }
    return _searchAreaColor;
}
-(NSString *)cancelBtnName{
    if (!_cancelBtnName) {
        _cancelBtnName = @"取消";
    }
    return _cancelBtnName;
}
-(UIColor *)canceBtnColor{
    if (!_canceBtnColor) {
        _canceBtnColor =[UIColor hexStringToColor:@"64c961"];
    }
    return _canceBtnColor;
}
-(UIColor *)backImageviewColor{
    if (!_backImageviewColor) {
        _backImageviewColor =[UIColor hexStringToColor:@"dddddd"];
    }
    return _backImageviewColor;
}
-(UIOffset)mouseOffSet{
   
   UIOffset  offset=  UIOffsetMake(10, 0);
    return offset;
}
@end
