//
//  BCHistoryViewController.m
//  BCTest001
//
//  Created by Barney Chen on 2014/11/24.
//  Copyright (c) 2014年 CWH. All rights reserved.
//

#import "BCHistoryViewController.h"
#import "BCHistoryCell.h"
#import <MMDrawerController.h>
#import <MMDrawerVisualState.h>
#import <UIViewController+MMDrawerController.h>
#import <ReactiveCocoa.h>
#import "BCWebViewController.h"


@implementation BCHistoryViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.history = [[NSMutableArray alloc] init];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    self.tableView.tableFooterView = [[UIView alloc] initWithFrame:CGRectZero];
    self.navigationItem.title = @"歷史紀錄";
    
    self.mm_drawerController.openDrawerGestureModeMask = MMOpenDrawerGestureModeAll;
    self.mm_drawerController.closeDrawerGestureModeMask = MMCloseDrawerGestureModeAll;
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    [[UIApplication sharedApplication] setStatusBarHidden:YES];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    BCHistoryCell *cell = [tableView dequeueReusableCellWithIdentifier:@"BCHistoryCell"];
    cell.keyLabel.text = self.history[indexPath.row];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
    BCWebViewController *webVC = (BCWebViewController *)self.mm_drawerController.rightDrawerViewController;
    webVC.urlStr = self.history[indexPath.row];
    [self.mm_drawerController openDrawerSide:MMDrawerSideRight animated:YES completion:nil];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.history.count;
}


@end
