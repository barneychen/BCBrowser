//
//  BCBaseViewController.h
//  BCTest001
//
//  Created by Barney Chen on 2014/11/24.
//  Copyright (c) 2014年 CWH. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MMDrawerController.h>
#import "BCRootViewController.h"
#import "BCWebViewController.h"
#import "BCHistoryViewController.h"

@interface BCBaseViewController : UIViewController

@property (nonatomic, strong) BCRootViewController *root;
@property (nonatomic, strong) BCWebViewController *web;
@property (nonatomic, retain) BCHistoryViewController *history;
@property (nonatomic, strong) MMDrawerController *drawer;

@end