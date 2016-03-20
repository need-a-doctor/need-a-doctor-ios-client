//
//  NADDoctorsViewController.m
//  NeedADoctor
//
//  Created by Dmitry Terekhov on 3/20/16.
//  Copyright © 2016 Dmitry Terekhov. All rights reserved.
//

#import "NADDoctorsViewController.h"
#import "NADDoctorTableViewCell.h"
#import "NADDayOfDoctorModel.h"

@interface NADDoctorsViewController () <UITableViewDataSource, UITableViewDelegate>

@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation NADDoctorsViewController

#pragma mark - UITableViewDataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return self.daysOfDoctors.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.daysOfDoctors[section] doctors].count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NADDoctorTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"DoctorCell" forIndexPath:indexPath];
    NADDayOfDoctorModel *dayOfDoctor = self.daysOfDoctors[indexPath.section];
    NADDoctorModel *doctor = dayOfDoctor.doctors[indexPath.row];
    [cell setupWithDay:dayOfDoctor.date doctor:doctor];
    return cell;
}

@end