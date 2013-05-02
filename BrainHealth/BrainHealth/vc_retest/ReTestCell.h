//
//  ReTestCell.h
//  BrainHealth
//
//  Created by timzero on 13. 5. 2..
//  Copyright (c) 2013년 Tim. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ReTestCell : UITableViewCell

@property (retain, nonatomic) IBOutlet UIImageView *imageViewBG;
@property (retain, nonatomic) IBOutlet UILabel *labelNum;
@property (retain, nonatomic) IBOutlet UILabel *labelTitle;
@property (retain, nonatomic) IBOutlet UILabel *labelDate;
@property (retain, nonatomic) IBOutlet UIButton *button;

@end
