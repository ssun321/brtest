//
//  SubViewController.m
//  BrainHealth
//
//  Created by timzero on 13. 5. 6..
//  Copyright (c) 2013년 Tim. All rights reserved.
//

#import "SubViewController.h"

@interface SubViewController ()

@end

@implementation SubViewController

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
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)dealloc {
    [_label release];
    [super dealloc];
}
- (void)viewDidUnload {
    [self setLabel:nil];
    [super viewDidUnload];
}
- (IBAction)clickNext:(id)sender {
    [self.delegate next];
}
@end
