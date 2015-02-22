//
//  ViewController.m
//  longPressGuesture
//
//  Created by bbu on 2/22/15.
//  Copyright (c) 2015 bbu. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property(nonatomic,strong) UILongPressGestureRecognizer *longPressGuesture;
@property(nonatomic,strong) UIButton *btn;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _btn = [UIButton buttonWithType:UIButtonTypeSystem];
    [_btn setTitle:@"I AM" forState:UIControlStateNormal];
    _btn.frame = CGRectMake(0, 100, 100, 100);
    
    
    _longPressGuesture = [[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(longPressGuesture:)];
    
    //设置需要的首饰
    _longPressGuesture.numberOfTouchesRequired = 2;
    
    //设置允许移动的位移
    _longPressGuesture.allowableMovement = 100.0f;
    
    //设置长按的时间
    _longPressGuesture.minimumPressDuration = 2.0f;
    
    [self.view addGestureRecognizer:_longPressGuesture];
    
    [self.view addSubview:_btn];
}
-(void)longPressGuesture:(UILongPressGestureRecognizer *)sender
{
    NSLog(@"I AM LONG PRESS GUESTURE");
    
    if (sender.numberOfTouchesRequired == 2) {
        CGPoint tpoint1 = [sender locationOfTouch:0 inView:sender.view];
        CGPoint tpoint2 = [sender locationOfTouch:1 inView:sender.view];
        
        CGFloat midX = (tpoint1.x + tpoint2.x)/2;
        CGFloat midY = (tpoint1.y + tpoint2.y) /2;
        
        _btn.center = CGPointMake(midX, midY);
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
