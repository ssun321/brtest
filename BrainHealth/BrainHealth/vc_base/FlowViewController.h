//
//  FlowViewController.h
//  BrainHealth
//
//  Created by timzero on 13. 5. 6..
//  Copyright (c) 2013년 Tim. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FlowViewController : UIViewController

@property (nonatomic, assign) int index;
@property (nonatomic, retain) NSMutableArray* arrayData;
@property (nonatomic, retain) UIViewController* controller;

- (void)open:(NSString*)code animation:(BOOL)animation;


@end
