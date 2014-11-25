//
//  BCBaseViewController.m
//  BCTest001
//
//  Created by Barney Chen on 2014/11/24.
//  Copyright (c) 2014年 CWH. All rights reserved.
//

#import "BCBaseViewController.h"
#import "BCRootViewController.h"
#import "BCWebViewController.h"
#import <MMDrawerController.h>
#import <MMDrawerVisualState.h>

@implementation BCBaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.root = [[UIStoryboard storyboardWithName:@"Main" bundle:nil] instantiateViewControllerWithIdentifier:@"BCRootViewController"];
    self.web = [[UIStoryboard storyboardWithName:@"Main" bundle:nil] instantiateViewControllerWithIdentifier:@"BCWebViewController"];
    self.history = [[UIStoryboard storyboardWithName:@"Main" bundle:nil] instantiateViewControllerWithIdentifier:@"BCHistoryViewController"];
    
    self.web.urlStr = @"http://www.google.com";
    self.drawer = [[MMDrawerController alloc] init];
    self.drawer.centerViewController = self.root;
    self.drawer.rightDrawerViewController = self.web;
    self.drawer.leftDrawerViewController = self.history;
    
    self.drawer.showsShadow = NO;
    self.drawer.maximumLeftDrawerWidth = self.view.frame.size.width;
    self.drawer.maximumRightDrawerWidth = self.view.frame.size.width;
    [self.drawer setDrawerVisualStateBlock:[MMDrawerVisualState slideAndScaleVisualStateBlock]];
    
    [self.drawer setDrawerVisualStateBlock:^(MMDrawerController *drawerController, MMDrawerSide drawerSide, CGFloat percentVisible) {
        if (drawerSide == MMDrawerSideLeft) {
            [self.history.tableView reloadData];
        }
    }];
    [self addChildViewController:self.drawer];
    [self.view addSubview:self.drawer.view];
}

@end
