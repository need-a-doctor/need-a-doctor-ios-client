//
//  NADSettingsViewController.m
//  NeedADoctor
//
//  Created by Dmitry Terekhov on 3/19/16.
//  Copyright © 2016 Dmitry Terekhov. All rights reserved.
//

#import "NADSettingsViewController.h"
#import <MessageUI/MessageUI.h>

@interface NADSettingsViewController () <MFMailComposeViewControllerDelegate>

@end

@implementation NADSettingsViewController

#pragma mark - UITableViewDelegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 1 && indexPath.row == 0) {
        [self writeToUsCellTap];
    }
}

- (void)writeToUsCellTap {
    if ([MFMailComposeViewController canSendMail]) {
        MFMailComposeViewController * mailVC = [MFMailComposeViewController new];
        mailVC.view.tintColor = [UIColor colorWithRed:0.1 green:0.46 blue:0.82 alpha:1];
        mailVC.navigationBar.tintColor = [UIColor whiteColor];
        mailVC.mailComposeDelegate = self;
        [mailVC setSubject:@"iPhone app"];
        [mailVC setMessageBody:@"Добрый день!" isHTML:NO];
        [mailVC setToRecipients:@[@"umasterov@mail.ru"]];
        [self presentViewController:mailVC animated:YES completion:nil];
    } else {
        UIAlertView * alertView = [[UIAlertView alloc] initWithTitle:NSLocalizedString(@"Нет аккаунта почты", nil) message:@"Почта не настроена. Вы можете привязать аккаунт в настройках телефона." delegate:self cancelButtonTitle:@"Ок" otherButtonTitles:nil, nil];
        [alertView show];
    }
}

#pragma mark - MFMailComposeViewControllerDelegate
- (void)mailComposeController:(MFMailComposeViewController *)controller didFinishWithResult:(MFMailComposeResult)result error:(NSError *)error{
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end