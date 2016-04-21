//
//  ViewController.m
//  Menu
//
//  Created by CYY033 on 16/4/18.
//  Copyright © 2016年 LYC. All rights reserved.
//

#import "ViewController.h"
#import "TitleView.h"
#define RGB(r, g, b)    [UIColor colorWithRed : r / 255.0 green : g / 255.0 blue : b / 255.0 alpha : 1]

@interface ViewController  ()<UIScrollViewDelegate>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self.view addSubview:self.X_scrollView];
    [self.view addSubview:self.Y_ScrollView];
    [self.view addSubview:self.Main_ScrollView];
    
    TitleView *view = [[TitleView alloc] initWithFrame:CGRectMake(10,90 , 80, 80)];
    view.title_lable.attributedText = [view getAttrStrWeenk:@"课程表" Month:@""];
    [self.view addSubview:view];
    NSNumber *number = @9999999.89;
    NSString *str = [NSString stringWithFormat:@"%0.2f",[number doubleValue]];
    NSLog(@"%@",str);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (UIScrollView *)X_scrollView{
    if (!_X_scrollView) {
        _X_scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(90, 90, self.view.bounds.size.width - 100, 80)];
        NSArray *week_arr = @[@"星期一",@"星期二",@"星期三",@"星期四",@"星期五",@"星期六",@"星期日"];
        NSArray *Month_arr = @[@"1月1日",@"1月2日",@"1月3日",@"1月4日",@"1月5日",@"1月6日",@"1月7日"];
        for (int i = 0; i < [week_arr count]; i ++) {
            TitleView *view = [[TitleView alloc] initWithFrame:CGRectMake( i*80,0 , 80, 80)];
            view.title_lable.attributedText = [view getAttrStrWeenk:week_arr[i] Month:Month_arr[i]];
            [self radiusView:view];
            [_X_scrollView addSubview:view];
        }
        _X_scrollView.showsHorizontalScrollIndicator = NO;
        _X_scrollView.showsVerticalScrollIndicator   = NO;
        _X_scrollView.userInteractionEnabled         = NO;
        _X_scrollView.contentSize = CGSizeMake(80 *[week_arr count], 80);

    }
    return _X_scrollView;
}
- (UIScrollView *)Y_ScrollView{
    if (!_Y_ScrollView) {
        _Y_ScrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(10, 170, 80, self.view.frame.size.height - 270)];
        NSArray *time_arr = @[@"8点-9点",@"9点-10点",@"10点-11点",@"11点-12点",@"12点-1点",@"1点-2点",@"2点-3点",@"3点-4点",@"4点-5点",@"5点-6点"];
        for (int i = 0; i < [time_arr count]; i ++) {
            TitleView *view = [[TitleView alloc] initWithFrame:CGRectMake(0,i * 80 , 80, 80)];
            view.title_lable.attributedText = [view getAttrStrWeenk:time_arr[i] Month:@""];
            [self radiusView:view];
            [_Y_ScrollView addSubview:view];
        }
        _Y_ScrollView.showsHorizontalScrollIndicator = NO;
        _Y_ScrollView.showsVerticalScrollIndicator   = NO;
        _Y_ScrollView.userInteractionEnabled         = NO;
        _Y_ScrollView.contentSize = CGSizeMake(80,170 + 80*[time_arr count]);

    }
    return _Y_ScrollView;
}
- (UIScrollView *)Main_ScrollView{
    if (!_Main_ScrollView) {
        _Main_ScrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(90, 170, self.view.frame.size.width - 100, self.view.frame.size.height - 270)];
        NSArray *project_arr = @[@"语文",@"数学",@"外语",@"体育",@"政治",@"历史",@"物理"];
        for (int i = 0; i < 10; i ++) {
            for (int j = 0; j < [project_arr count] ; j ++) {
                TitleView *view = [[TitleView alloc] initWithFrame:CGRectMake(80 * j,i * 80 , 80, 80)];
                view.title_lable.attributedText = [view getAttrStrWeenk:project_arr[j] Month:@""];
                [self radiusView:view];
                [_Main_ScrollView addSubview:view];
            }
        }
        _Main_ScrollView.delegate = self;
        _Main_ScrollView.bounces = NO;
        _Main_ScrollView.showsHorizontalScrollIndicator = NO;
        _Main_ScrollView.showsVerticalScrollIndicator   = NO;
        _Main_ScrollView.contentSize = CGSizeMake(80 * [project_arr count], 80 * 10);
    }
    return _Main_ScrollView;
}
- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    _X_scrollView.contentOffset = CGPointMake(scrollView.contentOffset.x, 0);
    _Y_ScrollView.contentOffset = CGPointMake(0, scrollView.contentOffset.y);
}
//画圆角
- (void)radiusView:(UIView *)view{
    view.layer.masksToBounds = YES;
    view.layer.borderWidth   = 0.5;
    view.layer.borderColor   = [RGB(244, 244, 244) CGColor];
}
@end
