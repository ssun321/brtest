//
//  RootViewController.m
//  BrainHealth
//
//  Created by Tim on 13. 2. 20..
//  Copyright (c) 2013년 Tim. All rights reserved.
//

#import "RootViewController.h"
#import "MenuViewController.h"

@interface RootViewController ()

@end

@implementation RootViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    UIImageView* imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"intro.png"]];
    [self.view insertSubview:imageView atIndex:0];
    [imageView release];
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

- (IBAction)clickNext:(id)sender {
    MenuViewController* vc = [[MenuViewController alloc] initWithNibName:@"MenuViewController" bundle:nil];
    [self.navigationController pushViewController:vc animated:YES];
    [vc release];
}

@end
