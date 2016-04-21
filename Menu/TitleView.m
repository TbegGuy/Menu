//
//  TitleView.m
//  Menu
//
//  Created by CYY033 on 16/4/18.
//  Copyright © 2016年 LYC. All rights reserved.
//
#define RGB(r, g, b)    [UIColor colorWithRed : r / 255.0 green : g / 255.0 blue : b / 255.0 alpha : 1]

#import "TitleView.h"

@implementation TitleView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        self.backgroundColor = RGB(207, 239, 251);
//        self.backgroundColor = [UIColor blueColor];
        [self addSubview:self.title_lable];
    }
    return self;
}
- (UILabel *)title_lable{
    if (!_title_lable) {
        _title_lable = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, self.frame.size.width, self.frame.size.height)];
        _title_lable.numberOfLines = 0;
        _title_lable.textAlignment = NSTextAlignmentCenter;
    }
    return _title_lable;
}
//获得可变字符串
- (NSMutableAttributedString *)getAttrStrWeenk:(NSString *)text1 Month:(NSString *)text2{
    NSInteger len1 = [text1 length];
    NSInteger len2 = [text2 length];
    
    NSString *all_str;
    if (len2 >0) {
        all_str = [NSString stringWithFormat:@"%@\n%@",text1,text2];
    }else{
        all_str = text1;
    }
    NSMutableAttributedString * attributed_str = [[NSMutableAttributedString alloc]initWithString:all_str];
    [attributed_str addAttribute:NSFontAttributeName value:[UIFont systemFontOfSize:13] range:NSMakeRange(0, len1)];
    [attributed_str addAttribute:NSFontAttributeName value:[UIFont systemFontOfSize:10] range:NSMakeRange(len1+1, len2)];
    [attributed_str addAttribute:NSForegroundColorAttributeName value:RGB(211, 211, 211)  range:NSMakeRange(0, len1)];
    [attributed_str addAttribute:NSForegroundColorAttributeName value:RGB(211, 211, 211) range:NSMakeRange(len1+1, len2)];
    NSLog(@"%@",attributed_str);
    return attributed_str;
}
@end
