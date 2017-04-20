//
//  CountingView.m
//  CountIng
//
//  Created by 杨海涛 on 4/20/17.
//  Copyright © 2017 杨海涛. All rights reserved.
//

#import "CountingView.h"
#import "Config.h"

#define cubeHeiht   70
#define defalutFont 70
#define t1          @"STHeitiJ-Light"
#define t2          @"CourierNewPSMT"

@interface CountingView ()

@property (nonatomic, strong) UILabel *ms1;
@property (nonatomic, strong) UILabel *ms2;
@property (nonatomic, strong) UILabel *mi1;
@property (nonatomic, strong) UILabel *mi2;
@property (nonatomic, strong) UILabel *ho1;
@property (nonatomic, strong) UILabel *ho2;

@end

@implementation CountingView

- (instancetype)init{
    if (self = [super init]) {
        
    }
    return self;
}
- (UILabel *)ms1{
    if (!_ms1) {
        _ms1 = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH/8, cubeHeiht)];
        _ms1.font = [UIFont fontWithName:t1 size:defalutFont];
    }
    return _ms1;
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
