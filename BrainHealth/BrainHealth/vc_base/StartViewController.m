//
//  StartViewController.m
//  BrainHealth
//
//  Created by timzero on 13. 4. 2..
//  Copyright (c) 2013년 Tim. All rights reserved.
//

#import "StartViewController.h"
#import "ManagerLoginViewController.h"

@interface StartViewController ()

@end

@implementation StartViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.viewLogin.hidden = YES;
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation
{
    return UIInterfaceOrientationIsLandscape(toInterfaceOrientation);
}

- (IBAction)clickLogin:(id)sender {
    NSString* clsName = @"LoginViewController";
    Class cls = NSClassFromString(clsName);
    UIViewController* vc = [[cls alloc] initWithNibName:clsName bundle:nil];
    [self.navigationController pushViewController:vc animated:YES];
    [vc release];
}

- (IBAction)clickAddUser:(id)sender {
    NSString* clsName = @"AddUserViewController";
    Class cls = NSClassFromString(clsName);
    UIViewController* vc = [[cls alloc] initWithNibName:clsName bundle:nil];
    [self.navigationController pushViewController:vc animated:YES];
    [vc release];
}

- (IBAction)clickManager:(id)sender {
    ManagerLoginViewController* vc = [[ManagerLoginViewController alloc] initWithNibName:@"ManagerLoginViewController" bundle:nil];
    vc.nextKey = @"UserCenterViewController";
    [self.navigationController pushViewController:vc animated:YES];
    [vc release];
}

- (IBAction)clickTest:(id)sender {
    UIButton* button = (UIButton*)sender;
    button.selected = !button.selected;
    
    self.viewLogin.hidden = !button.selected;
    self.viewNoLogin.hidden = button.selected;
}


- (void)dealloc {
    [_label release];
    [_viewLogin release];
    [_viewNoLogin release];
    [super dealloc];
}
- (void)viewDidUnload {
    [self setLabel:nil];
    [self setViewLogin:nil];
    [self setViewNoLogin:nil];
    [super viewDidUnload];
}
@end
