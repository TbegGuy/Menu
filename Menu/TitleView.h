//
//  TitleView.h
//  Menu
//
//  Created by CYY033 on 16/4/18.
//  Copyright © 2016年 LYC. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TitleView : UIView
@property (nonatomic ,strong) UILabel *title_lable;
- (NSMutableAttributedString *)getAttrStrWeenk:(NSString *)text1 Month:(NSString *)text2;
@end
