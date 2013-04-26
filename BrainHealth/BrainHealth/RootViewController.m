//
//  RootViewController.m
//  BrainHealth
//
//  Created by Tim on 13. 2. 20..
//  Copyright (c) 2013년 Tim. All rights reserved.
//

#import "RootViewController.h"

@interface RootViewController ()

@end

@implementation RootViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    UIImageView* imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"Default-Landscape.png"]];
    [self.view insertSubview:imageView atIndex:0];
    [imageView release];
    
    [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(clickNext:) userInfo:nil repeats:NO];
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
    
#warning 시작화면 설정(바꿔서 테스트)
    //NSString* clsName = @"StartViewController";
    NSString* clsName = @"ResultViewController";
    Class cls = NSClassFromString(clsName);
    UIViewController* vc = [[cls alloc] initWithNibName:clsName bundle:nil];
    [self.navigationController pushViewController:vc animated:YES];
    [vc release];
}

@end
