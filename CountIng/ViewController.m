//
//  ViewController.m
//  CountIng
//
//  Created by 杨海涛 on 4/18/17.
//  Copyright © 2017 杨海涛. All rights reserved.
//

#import "ViewController.h"
#import "Config.h"

@interface ViewController ()

@property (nonatomic, weak)   NSTimer *timer;
@property (nonatomic, assign) float countM;
@property (nonatomic, assign) NSInteger countH;
@property (nonatomic, strong) UILabel *startTime;
@property (nonatomic, strong) UILabel *stopTime;
@property (nonatomic, strong) UIButton *startBtn;
@property (nonatomic, strong) UIButton *stopBtn;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    
    [self configUI];
}
- (void)counting{
    self.countM ++;
    if (self.countM >= 6000) {
        self.countH ++;
        self.countM = 0;
    }
    NSString *minute ;
    if (self.countM <1000) {
        minute = [NSString stringWithFormat:@"0%.2f",self.countM/100];
    }else{
        minute = [NSString stringWithFormat:@"%.2f",self.countM/100];
    }
    NSString *hour ;
    if (self.countH <10) {
        hour = [NSString stringWithFormat:@"0%ld",(long)self.countH];
    }else{
        hour = [NSString stringWithFormat:@"%ld",(long)self.countH];
    }
    NSString *start = [NSString stringWithFormat:@"%@:%@",hour,minute];
    if (self.countH <=1) {
        self.startTime.text = start;
    }else{
        self.stopTime.text = start;
    }
    
}
- (void)startCounting{
    self.countM = 0;
    self.countH = 0;
    self.timer = [NSTimer scheduledTimerWithTimeInterval:0.01 target:self selector:@selector(counting) userInfo:NULL repeats:YES];
}
- (void)stopCounting{
    [self.timer invalidate];
//    self.timer = nil;
}
- (void)configUI{
    [self.view addSubview:self.startTime];
    [self.view addSubview:self.stopTime];
    
    [self.view addSubview:self.startBtn];
    [self.view addSubview:self.stopBtn];
    
}

- (UILabel *)startTime{
    if (!_startTime) {
        _startTime = [[UILabel alloc]initWithFrame:CGRectMake(0, 200, SCREEN_WIDTH, 70)];
        _startTime.font = [UIFont fontWithName:@"CourierNewPSMT" size:60];
        _startTime.textAlignment = NSTextAlignmentCenter;
        _startTime.text = @"00:00.00";
    }
    return _startTime;
}
- (UILabel *)stopTime{
    if (!_stopTime) {
        _stopTime = [[UILabel alloc]initWithFrame:CGRectMake(0, 300, SCREEN_WIDTH, 70)];
        _stopTime.font = [UIFont fontWithName:@"CourierNewPSMT" size:60];
        _stopTime.textAlignment = NSTextAlignmentCenter;
        _stopTime.text = @"00:00.00";
    }
    return _stopTime;
}

- (UIButton *)stopBtn{
    if (!_stopBtn) {
        _stopBtn = [[UIButton alloc]initWithFrame:CGRectMake(SCREEN_WIDTH - 110, 400, 60, 60)];
        _stopBtn.backgroundColor = [UIColor redColor];
        [_stopBtn setTitle:@"STOP" forState:UIControlStateNormal];
        _stopBtn.layer.masksToBounds = YES;
        _stopBtn.layer.cornerRadius = 30;
        [_stopBtn addTarget:self action:@selector(stopCounting) forControlEvents:UIControlEventTouchUpInside];
    }
    return _stopBtn;
}
- (UIButton *)startBtn{
    if (!_startBtn) {
        _startBtn = [[UIButton alloc]initWithFrame:CGRectMake(50, 400, 60, 60)];
        _startBtn.backgroundColor = [UIColor greenColor];
        [_startBtn setTitle:@"START" forState:UIControlStateNormal];
        _startBtn.layer.masksToBounds = YES;
        _startBtn.layer.cornerRadius = 30;
        [_startBtn addTarget:self action:@selector(startCounting) forControlEvents:UIControlEventTouchUpInside];
    }
    return _startBtn;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
