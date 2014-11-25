//
//  BCRootViewController.h
//  BCTest001
//
//  Created by Barney Chen on 2014/8/23.
//  Copyright (c) 2014年 CWH. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MMDrawerController.h>
#import "BCWebViewController.h"

@interface BCRootViewController : UIViewController<UITextFieldDelegate>

@property (weak, nonatomic) IBOutlet UITextField *searchKey;
@property (nonatomic, strong) BCWebViewController *web;
@property (nonatomic, strong) MMDrawerController *drawer;

@end
