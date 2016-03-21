//
//  NADMyRecordsViewController.m
//  NeedADoctor
//
//  Created by Dmitry Terekhov on 3/18/16.
//  Copyright © 2016 Dmitry Terekhov. All rights reserved.
//

#import "NADMyRecordsViewController.h"

@interface NADMyRecordsViewController () <UITableViewDataSource, UITableViewDelegate>

@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation NADMyRecordsViewController

#pragma mark - UITalbeViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [self.tableView dequeueReusableCellWithIdentifier:@"MyRecordCell" forIndexPath:indexPath];
    return cell;
}

@end