//
//  FlowViewController.m
//  BrainHealth
//
//  Created by timzero on 13. 5. 6..
//  Copyright (c) 2013년 Tim. All rights reserved.
//

#import <QuartzCore/QuartzCore.h>
#import "FlowViewController.h"

#import "SubViewController.h"

@interface FlowViewController ()

@end

@implementation FlowViewController

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
    
    _arrayData = [[NSMutableArray alloc] initWithCapacity:10];
    
    [_arrayData addObject:@"111"];
    [_arrayData addObject:@"112"];
    [_arrayData addObject:@"113"];
    [_arrayData addObject:@"114"];
    [_arrayData addObject:@"115"];
    
    [_arrayData addObject:@"121"];
    [_arrayData addObject:@"122"];
    [_arrayData addObject:@"123"];
    [_arrayData addObject:@"124"];
    [_arrayData addObject:@"125"];
    
    _index = 0;
    [self open:[_arrayData objectAtIndex:_index] animation:NO];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)open:(NSString *)code animation:(BOOL)isAnimation{
    
    if(self.controller){
        [self.controller.view removeFromSuperview];
        [self.controller release];
        self.controller = nil;
    }
    
    SubViewController* vc = [[SubViewController alloc] initWithNibName:@"SubViewController" bundle:nil];
    
    vc.delegate = self;
    vc.label.text = code;
    
    self.controller = vc;
    
    [self.view addSubview:self.controller.view];
    
    if(isAnimation){
        CATransition *animation = [CATransition animation];
        [animation setDelegate:self];
        [animation setType:kCATransitionPush];
        [animation setSubtype:kCATransitionFromRight];
        [animation setDuration:0.3f];
        [animation setTimingFunction:[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut]];
        
        [[self.view layer] addAnimation:animation forKey:@"View Change Ani"];
    }
    
}

- (void)next{
    
    _index++;
    
    if(_index >= _arrayData.count){
        [self finish];
    }else{
        NSString* code = [_arrayData objectAtIndex:_index];
        [self open:code animation:YES];
    }
    
}

- (void)finish{
    NSString* clsName = @"ResultViewController";
    Class cls = NSClassFromString(clsName);
    UIViewController* vc = [[cls alloc] initWithNibName:clsName bundle:nil];
    [self.navigationController pushViewController:vc animated:YES];
    [vc release];
}

@end
