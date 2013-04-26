//
//  ResultViewController.h
//  BrainHealth
//
//  Created by timzero on 13. 4. 26..
//  Copyright (c) 2013년 Tim. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ResultViewController : UIViewController

@property (retain, nonatomic) IBOutlet UIImageView *imageViewBG;
@property (retain, nonatomic) IBOutlet UIButton *buttonTab0;
@property (retain, nonatomic) IBOutlet UIButton *buttonTab1;
@property (retain, nonatomic) IBOutlet UIScrollView *scrollView;

@property (retain, nonatomic) IBOutlet UIView *viewPopup;
@property (retain, nonatomic) IBOutlet UITableView *tableViewPopup;

- (IBAction)clickBack:(id)sender;
- (IBAction)clickTab0:(id)sender;
- (IBAction)clickTab1:(id)sender;

- (IBAction)clickPopupClose:(id)sender;

@end
