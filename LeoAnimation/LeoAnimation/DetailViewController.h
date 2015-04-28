//
//  DetailViewController.h
//  LeoAnimation
//
//  Created by 张燎原 on 15/4/28.
//  Copyright (c) 2015年 张燎原. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DetailViewController : UIViewController

@property (strong, nonatomic) id detailItem;
@property (weak, nonatomic) IBOutlet UILabel *detailDescriptionLabel;

@end

