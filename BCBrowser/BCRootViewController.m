//
//  BCRootViewController.m
//  BCTest001
//
//  Created by Barney Chen on 2014/8/23.
//  Copyright (c) 2014年 CWH. All rights reserved.
//

#import "BCRootViewController.h"
#import <ReactiveCocoa.h>
#import "BCWebViewController.h"
#import <MMDrawerController.h>
#import <MMDrawerVisualState.h>
#import <UIViewController+MMDrawerController.h>
#import "BCHistoryViewController.h"

#define kOFFSET_FOR_KEYBOARD 80.0

@implementation BCRootViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.searchKey.delegate = self;
    [self.searchKey becomeFirstResponder];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    [[UIApplication sharedApplication] setStatusBarHidden:YES];
//    [self.navigationController.navigationBar setBackgroundImage:[[UIImage alloc] init] forBarMetrics:UIBarMetricsDefault];
//    [self.navigationController.navigationBar setShadowImage:[[UIImage alloc] init]];
//    self.navigationController.toolbarHidden = YES;
    self.mm_drawerController.openDrawerGestureModeMask = MMOpenDrawerGestureModeAll;
    
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    [[UIApplication sharedApplication] setStatusBarHidden:YES];
}

- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string {
//    NSLog(@"%@", textField.text);
    return true;
}

-(void)textFieldDidBeginEditing:(UITextField *)sender {
    [self keyboardWillShow];
    
}

- (void)textFieldDidEndEditing:(UITextField *)textField {
    [self keyboardWillHide];
    BCWebViewController *webVC = (BCWebViewController *)self.mm_drawerController.rightDrawerViewController;
    BCHistoryViewController *historyVC = (BCHistoryViewController *)self.mm_drawerController.leftDrawerViewController;
    if (![textField.text isEqualToString:@""]) {
        [historyVC.history addObject:textField.text];
        webVC.urlStr = textField.text;
        [webVC reloadWebView];
        [self.mm_drawerController openDrawerSide:MMDrawerSideRight animated:YES completion:nil];
    }
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    if (textField == self.searchKey) {
        [textField resignFirstResponder];
    }
    return NO;
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    
    [self.searchKey resignFirstResponder];
    [super touchesBegan:touches withEvent:event];
}

- (void)keyboardWillShow {
    self.mm_drawerController.openDrawerGestureModeMask = MMOpenDrawerGestureModeNone;
    if (self.view.frame.origin.y >= 0) {
        [self setViewMovedUp:YES];
    } else if (self.view.frame.origin.y < 0) {
        [self setViewMovedUp:NO];
    }
}

- (void)keyboardWillHide {
    self.mm_drawerController.openDrawerGestureModeMask = MMOpenDrawerGestureModeAll;
    if (self.view.frame.origin.y >= 0) {
        [self setViewMovedUp:YES];
    } else if (self.view.frame.origin.y < 0) {
        [self setViewMovedUp:NO];
    }
}

- (void)setViewMovedUp:(BOOL)movedUp {
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDuration:0.3];
    
    CGRect rect = self.view.frame;
    if (movedUp) {
        rect.origin.y -= kOFFSET_FOR_KEYBOARD;
        rect.size.height += kOFFSET_FOR_KEYBOARD;
    } else {
        rect.origin.y += kOFFSET_FOR_KEYBOARD;
        rect.size.height -= kOFFSET_FOR_KEYBOARD;
    }
    self.view.frame = rect;
    
    [UIView commitAnimations];
}
@end
