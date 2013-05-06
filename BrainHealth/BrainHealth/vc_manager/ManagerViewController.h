//
//  ManagerViewController.h
//  BrainHealth
//
//  Created by timzero on 13. 3. 14..
//  Copyright (c) 2013년 Tim. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ManagerViewController : UIViewController

@property (retain, nonatomic) IBOutlet UIScrollView *scrollView;
@property (retain, nonatomic) IBOutlet UIView *viewIn;
@property (retain, nonatomic) IBOutlet UITableView *tableView;

@property (retain, nonatomic) NSMutableArray* arrayData;

- (IBAction)clickBack:(id)sender;

@end
