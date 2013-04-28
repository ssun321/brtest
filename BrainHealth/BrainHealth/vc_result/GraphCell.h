//
//  GraphView.h
//  BrainHealth
//
//  Created by timzero on 13. 4. 26..
//  Copyright (c) 2013년 Tim. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef enum {
    GraphTypeDay = 0,
    GraphTypeMonth,
    GraphTypeQuarter,
    GraphTypeHalf,
    GraphTypeYear,
}GraphType;

@interface GraphCell : UITableViewCell

@property (nonatomic, assign) GraphType type;

@property (nonatomic, retain) UIView* viewBack;
@property (nonatomic, retain) UIImageView* imageViewMain;
@property (nonatomic, retain) UIButton* buttonLeft;
@property (nonatomic, retain) UIButton* buttonRight;


- (void)resetRect:(CGRect)rect;


@end
