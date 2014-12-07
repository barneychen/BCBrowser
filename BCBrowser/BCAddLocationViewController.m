//
//  BCAddLocationViewController.m
//  BCBrowser
//
//  Created by Barney Chen on 2014/12/8.
//  Copyright (c) 2014年 CWH. All rights reserved.
//

#import "BCAddLocationViewController.h"
#import "BCNaviViewController.h"
#import <ReactiveCocoa.h>

@implementation BCAddLocationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.locations = [[NSMutableArray alloc] initWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"Locations" ofType:@"plist"]];
    
    self.name.delegate = self;
    self.location.delegate = self;
    self.addButton.rac_command = [[RACCommand alloc] initWithSignalBlock:^RACSignal *(id input) {
        
        NSDictionary *newLocation = @{@"Name" : self.name.text, @"Location" : self.location.text};
        [self.locations addObject:newLocation];
        
        NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
        NSString *documentsDirectory = [paths objectAtIndex:0];
        NSString *filePath = [documentsDirectory stringByAppendingPathComponent:@"Locations.plist"];
        
        BOOL status = [self.locations writeToFile:filePath atomically:YES];
        
        BCNaviViewController *vc = [[UIStoryboard storyboardWithName:@"Main" bundle:nil] instantiateViewControllerWithIdentifier:@"BCNaviViewController"];
        [self.navigationController pushViewController:vc animated:YES];
        
        return [RACSignal empty];
    }];
}


@end
