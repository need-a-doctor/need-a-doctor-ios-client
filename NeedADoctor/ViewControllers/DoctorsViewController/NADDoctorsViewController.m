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
#import "NADAuthViewController.h"

static NSString *const ShowAuthVCSegue = @"showAuthVC";

@interface NADDoctorsViewController () <UITableViewDataSource, UITableViewDelegate, NADDoctorTableViewProtocol>

@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (nonatomic) NSDate *selectedDay;
@property (nonatomic) NADDoctorModel *selectedDoctor;
@property (nonatomic) NSIndexPath *selectedIndexPath;

@end

@implementation NADDoctorsViewController

#pragma mark - Lifecycle
- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = self.specialization.name;
}

#pragma mark - UITableViewDataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return self.daysOfDoctors.count;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    NADDayOfDoctorModel *dayOfDoctor = self.daysOfDoctors[section];
    NSDateFormatter *dateFormatter = [NSDateFormatter new];
    [dateFormatter setDateFormat:@"dd.MM.yyyy"];
    return [dateFormatter stringFromDate:dayOfDoctor.date];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.daysOfDoctors[section] doctors].count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NADDoctorTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"DoctorCell" forIndexPath:indexPath];
    NADDayOfDoctorModel *dayOfDoctor = self.daysOfDoctors[indexPath.section];
    NADDoctorModel *doctor = dayOfDoctor.doctors[indexPath.row];
    [cell setupWithDay:dayOfDoctor.date doctor:doctor delegate:self];
    return cell;
}

#pragma mark - DoctorTableViewProtocol
- (void)doctorCellDidTapped:(UITableViewCell *)cell doctor:(NADDoctorModel *)doctor day:(NSDate *)day {
    self.selectedIndexPath = [self.tableView indexPathForCell:cell];
    self.selectedDay = day;
    self.selectedDoctor = doctor;
    [self performSegueWithIdentifier:ShowAuthVCSegue sender:self];
}

- (void)currentUserDidRecorded {
    if (self.selectedIndexPath) {
        [self.tableView reloadRowsAtIndexPaths:@[self.selectedIndexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
    }
}

#pragma mark - Storyboard
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:ShowAuthVCSegue]) {
        NADAuthViewController *authVC = ((UINavigationController *)segue.destinationViewController).viewControllers.firstObject;
        [authVC setupWithDay:self.selectedDay doctor:self.selectedDoctor delegate:self];
        self.selectedDay = nil;
        self.selectedDoctor = nil;
    }
}

@end