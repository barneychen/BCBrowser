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
    self.back.rac_command = [[RACCommand alloc] initWithSignalBlock:^RACSignal *(id input) {
        [self.mm_drawerController setCenterViewController:self.mm_drawerController.centerViewController withFullCloseAnimation:YES completion:nil];
        return [RACSignal empty];
    }];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    NSString *query = [self.urlStr stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    NSString *url = [NSString stringWithFormat:@"http://www.google.com/search?hl=en&site=&source=hp&q=%@", query];
    NSURLRequest *req = [[NSURLRequest alloc] initWithURL:[NSURL URLWithString:url]];
    [self.webView loadRequest:req];
    
    [[UIApplication sharedApplication] setStatusBarHidden:YES];
    [self.navigationController.navigationBar setBackgroundImage:[[UIImage alloc] init] forBarMetrics:UIBarMetricsDefault];
    [self.navigationController.navigationBar setShadowImage:[[UIImage alloc] init]];
    self.navigationController.toolbarHidden = YES;
    self.mm_drawerController.openDrawerGestureModeMask = MMOpenDrawerGestureModeAll;
//    self.mm_drawerController.closeDrawerGestureModeMask = MMCloseDrawerGestureModeAll;
    
    self.back.layer.cornerRadius = 20.0;
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    [[UIApplication sharedApplication] setStatusBarHidden:YES];
}
@end