//
//  BCWebViewController.h
//  BCTest001
//
//  Created by Barney Chen on 2014/11/23.
//  Copyright (c) 2014年 CWH. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BCWebViewController : UIViewController

@property (weak, nonatomic) IBOutlet UIWebView *webView;
@property (nonatomic, strong) NSString *urlStr;
@property (weak, nonatomic) IBOutlet UIButton *back;

@end
