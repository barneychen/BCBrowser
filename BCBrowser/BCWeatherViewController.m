//
//  BCWeatherViewController.m
//  BCBrowser
//
//  Created by barney.chen on 2014/11/27.
//  Copyright (c) 2014年 CWH. All rights reserved.
//

#import "BCWeatherViewController.h"
#import "JLWeather.h"
#import "BCHistoryCell.h"
#import "BCWebViewController.h"

@interface BCWeatherViewController ()

@end

@implementation BCWeatherViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    JLWeather *weather = [[JLWeather alloc] init];
    [weather getCurrentWeatherWithCityName:@"taipei" withCompletion:^(BOOL success) {
        self.tempLabel.text = [NSString stringWithFormat:@"%i", (int)weather.tempCurrent];
    }];
    
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    
    
    self.history = [[NSMutableArray alloc] init];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 69;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    BCHistoryCell *cell = [tableView dequeueReusableCellWithIdentifier:@"BCHistoryCell"];
//    cell.keyLabel.text = self.history[indexPath.row];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
//    BCWebViewController *webVC = (BCWebViewController *)self.mm_drawerController.rightDrawerViewController;
//    webVC.urlStr = self.history[indexPath.row];
//    [self.mm_drawerController openDrawerSide:MMDrawerSideRight animated:YES completion:nil];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 3;
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
