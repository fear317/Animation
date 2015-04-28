//
//  DetailViewController.m
//  LeoAnimation
//
//  Created by 张燎原 on 15/4/28.
//  Copyright (c) 2015年 张燎原. All rights reserved.
//

#import "DetailViewController.h"
#import "BasicGraphicsView.h"

@interface DetailViewController ()

@end

@implementation DetailViewController

#pragma mark - Managing the detail item

- (void)setDetailItem:(id)newDetailItem {
    if (_detailItem != newDetailItem) {
        _detailItem = newDetailItem;
            
        // Update the view.
//        [self configureView];
        [self addViewWith:[self.detailItem description]];
    }
}

- (void)configureView {
    // Update the user interface for the detail item.
    if (self.detailItem) {
        self.detailDescriptionLabel.text = [self.detailItem description];
    }
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self configureView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)addViewWith:(NSString *)title
{
    if ([title isEqualToString:@"绘制基本图形"]) {
        UIView *basicGraphics = [[BasicGraphicsView alloc] initWithFrame:CGRectMake(0, 100, self.view.frame.size.width, 300)];
        [self.view addSubview:basicGraphics];
    }else if ([title isEqualToString:@"alpha渐变动画"])
    {
        [self addFadeInFadeOutAnimation1];
        [self addFadeInFadeOutAnimation2];
    }else if ([title isEqualToString:@"位移动画"])
    {
        [self moveByLineAnimation];
    }
}

- (void)addFadeInFadeOutAnimation1
{
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 100, 100, 50)];
    [view setBackgroundColor:[UIColor redColor]];
    [self.view addSubview:view];
    
    [UIView animateWithDuration:1.0 animations:^{
        view.alpha = 0;
    }];
}

- (void)addFadeInFadeOutAnimation2
{
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(120, 100, 100, 50)];
    [view setBackgroundColor:[UIColor blueColor]];
    [self.view addSubview:view];
    
    [UIView animateWithDuration:3.0 animations:^{
    
        view.alpha = 0;
    }completion:^(BOOL finished){
    
        [view removeFromSuperview];
        [self addFadeInFadeOutAnimation2];
    }];
    
}

- (void)moveByLineAnimation
{
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button addTarget:self action:@selector(stopButton:) forControlEvents:UIControlEventTouchUpInside];
    [button setFrame:CGRectMake(120, 100, 100, 50)];
    [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [button setTitle:@"停止动画" forState:UIControlStateNormal];
    [self.view addSubview:button];
    
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 100, 100, 50)];
    view.tag = 1000;
    [view setBackgroundColor:[UIColor redColor]];
    [self.view addSubview:view];
    [UIView animateWithDuration:6.0 animations:^{
        view.center = CGPointMake(300, 300);
    }];
}

- (void)stopButton:(id)sender
{
    for (UIView *subView in [self.view subviews]) {
        if (subView.tag == 1000) {
            [subView.layer removeAllAnimations];
            [subView setBackgroundColor:[UIColor greenColor]];

            return;
        }
    }
}
@end
