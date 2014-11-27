//
//  BCWeatherViewController.h
//  BCBrowser
//
//  Created by barney.chen on 2014/11/27.
//  Copyright (c) 2014年 CWH. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BCWeatherViewController : UIViewController <UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, weak) IBOutlet UILabel *tempLabel;

@property (nonatomic, strong) IBOutlet UITableView *tableView;

@property (nonatomic, strong) NSMutableArray *history;

@end
