//
//  BCNaviViewController.m
//  BCBrowser
//
//  Created by Barney Chen on 2014/12/8.
//  Copyright (c) 2014年 CWH. All rights reserved.
//

#import "BCNaviViewController.h"
#import "BCNaviCell.h"
#import <ReactiveCocoa.h>
@interface BCNaviViewController()

@property (nonatomic, strong) NSArray *locations;

@end


@implementation BCNaviViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    self.locations = [[NSArray alloc] initWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"Locations" ofType:@"plist"]];
    self.tableView.tableHeaderView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 50)];
    self.tableView.tableFooterView = [[UIView alloc] initWithFrame:CGRectZero];
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.locations.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    BCNaviCell *cell = [tableView dequeueReusableCellWithIdentifier:@"BCNaviCell"];
    [cell.button setTitle:self.locations[indexPath.row][@"Name"] forState:UIControlStateNormal];
    cell.button.layer.cornerRadius = 5.0;
    cell.button.layer.borderWidth = 2.0;
    cell.button.layer.borderColor = [UIColor lightGrayColor].CGColor;
    cell.button.rac_command = [[RACCommand alloc] initWithSignalBlock:^RACSignal *(id input) {
        NSString *url;
        if ([[UIApplication sharedApplication] canOpenURL:[NSURL URLWithString:@"comgooglemaps://"]]) {
            // open google map app
            url = [NSString stringWithFormat:@"comgooglemaps://?daddr=%@", self.locations[indexPath.row][@"Location"]];
        } else {
            // open google map website
            url = [NSString stringWithFormat:@"http://maps.google.com/maps?daddr=%@", self.locations[indexPath.row][@"Location"]];
        }
        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:url]];
        return [RACSignal empty];
    }];
    return cell;
}

//- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
//    
//}

@end
