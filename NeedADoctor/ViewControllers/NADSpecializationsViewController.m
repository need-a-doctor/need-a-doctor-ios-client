//
//  NADDoctorsViewController.m
//  NeedADoctor
//
//  Created by Dmitry Terekhov on 3/18/16.
//  Copyright © 2016 Dmitry Terekhov. All rights reserved.
//

#import "NADSpecializationsViewController.h"
#import "NADSpecializationModel.h"
#import "NADDayOfDoctorModel.h"
#import "NADDoctorsViewController.h"

static NSString *const ShowDoctorsVCSegue = @"showDoctorsVC";

@interface NADSpecializationsViewController () <UITableViewDataSource, UITableViewDelegate>

@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (nonatomic) NSArray *specializations;

@end

@implementation NADSpecializationsViewController

#pragma mark - Lifecycle
- (void)viewDidLoad {
    [super viewDidLoad];
    
    [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    NSString *URLEndpoint = @"specializations";
    
    [App().networkManager GET:URLEndpoint parameters:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nonnull responseObject) {
        [MBProgressHUD hideHUDForView:self.view animated:YES];
        self.specializations = [MTLJSONAdapter modelsOfClass:NADSpecializationModel.class fromJSONArray:responseObject error:nil];
        [self.tableView reloadData];
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        [MBProgressHUD hideHUDForView:self.view animated:YES];
    }];
}

#pragma mark - UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.specializations.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"SpecializationCell" forIndexPath:indexPath];
    cell.textLabel.text = [self.specializations[indexPath.row] name];
    cell.detailTextLabel.text = [self.specializations[indexPath.row] descript];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    NSString *URLEndpoint = @"doctors/grouped-by-date";
    
    [App().networkManager GET:URLEndpoint parameters:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nonnull responseObject) {
        [MBProgressHUD hideHUDForView:self.view animated:YES];
        NSArray *daysOfDoctors = [MTLJSONAdapter modelsOfClass:NADDayOfDoctorModel.class fromJSONArray:responseObject error:nil];
        
        [self performSegueWithIdentifier:ShowDoctorsVCSegue sender:daysOfDoctors];
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        [MBProgressHUD hideHUDForView:self.view animated:YES];
    }];
}

#pragma mark - Storyboard
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:ShowDoctorsVCSegue]) {
        NSArray *daysOfDoctors = sender;
        NADDoctorsViewController *doctorsVC = segue.destinationViewController;
        doctorsVC.daysOfDoctors = daysOfDoctors;
    }
}

@end