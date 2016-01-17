//
//  LogViewController.m
//  TrackLocation
//
//  Created by Stanislav Shpak on 1/8/16.
//  Copyright © 2016 Stanislav Shpak. All rights reserved.
//

#import "LogViewController.h"
#import "EventLogger.h"

@interface LogViewController () {
    NSArray *_data;
    NSDateFormatter *_dateFormatter;
}
@end

@implementation LogViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _data = [[EventLogger sharedInstance] events];
    [self.tableView reloadData];
    
    _dateFormatter = [[NSDateFormatter alloc] init];
    [_dateFormatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *cellIdentifier = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    
    NSDictionary *event = _data[indexPath.row];
    cell.textLabel.text = event[@"title"];
    
    NSDate *date = event[@"date"];
    NSString *stringDate = [_dateFormatter stringFromDate:date];
    cell.detailTextLabel.text = stringDate;
    
    return cell;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _data.count;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
