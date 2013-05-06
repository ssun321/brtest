//
//  SubViewController.h
//  BrainHealth
//
//  Created by timzero on 13. 5. 6..
//  Copyright (c) 2013년 Tim. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SubViewController : UIViewController

@property (nonatomic, assign) id delegate;

@property (retain, nonatomic) IBOutlet UILabel *label;


- (IBAction)clickNext:(id)sender;

@end
