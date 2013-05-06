//
//  ManagerCell.h
//  BrainHealth
//
//  Created by timzero on 13. 4. 29..
//  Copyright (c) 2013년 Tim. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ThreeRangeSlider.h"

@interface ManagerCell : UITableViewCell

@property (retain, nonatomic) IBOutlet UILabel *labelName;
@property (retain, nonatomic) IBOutlet UIButton *buttonA1;
@property (retain, nonatomic) IBOutlet UIButton *buttonA2;
@property (retain, nonatomic) IBOutlet UIButton *buttonA3;
@property (retain, nonatomic) IBOutlet UIButton *buttonB;
@property (retain, nonatomic) IBOutlet UIButton *buttonC;
@property (retain, nonatomic) IBOutlet UIButton *buttonX;
@property (retain, nonatomic) IBOutlet UIImageView *imageViewSlider;
@property (retain, nonatomic) IBOutlet UILabel *labelX;
@property (retain, nonatomic) IBOutlet ThreeRangeSlider *slider;

- (IBAction)clickLevel:(id)sender;
- (IBAction)clickX:(id)sender;

@end
