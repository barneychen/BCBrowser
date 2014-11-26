//
//  BCWebViewController.m
//  BCTest001
//
//  Created by Barney Chen on 2014/11/23.
//  Copyright (c) 2014年 CWH. All rights reserved.
//

#import "BCWebViewController.h"
#import <MMDrawerController.h>
#import <MMDrawerVisualState.h>
#import <UIViewController+MMDrawerController.h>
#import <ReactiveCocoa.h>
#import "UIWebVIew+SwipeGesture.h"


@implementation BCWebViewController

- (void) viewDidLoad {
    [super viewDidLoad];
    self.urlStr = @"";
    [self.webView useSwipeGesture];
    self.webView.scalesPageToFit = YES;
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self reloadWebView];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"Back" style:UIBarButtonItemStyleDone target:self action:nil];
    self.mm_drawerController.openDrawerGestureModeMask = MMOpenDrawerGestureModeAll;
    self.mm_drawerController.closeDrawerGestureModeMask = MMCloseDrawerGestureModeAll;
    
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
}

- (void)reloadWebView {
    NSString *query = [self.urlStr stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    NSString *url = [NSString stringWithFormat:@"http://www.google.com/search?hl=en&site=&source=hp&q=%@", query];
    NSURLRequest *req = [[NSURLRequest alloc] initWithURL:[NSURL URLWithString:url]];
    [self.webView loadRequest:req];
}
@end