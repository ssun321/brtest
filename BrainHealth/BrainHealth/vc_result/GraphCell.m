//
//  GraphView.m
//  BrainHealth
//
//  Created by timzero on 13. 4. 26..
//  Copyright (c) 2013년 Tim. All rights reserved.
//

#import <QuartzCore/QuartzCore.h>

#import "result.h"
#import "GraphCell.h"

@implementation GraphCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    
    if (self) {
        
        _viewBack = [[UIView alloc] initWithFrame:CGRectZero];
        
        self.backgroundColor = [UIColor clearColor];
        
        UIImage* image = [UIImage imageNamed:@"result_graph_contents_01_.png"];
        _imageViewMain = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, image.size.width, image.size.height)];
        [_viewBack addSubview:_imageViewMain];
        [_imageViewMain release];
        
        UIImage* image0;
        UIImage* image1;
        
        int y = 0;
        
        image0 = [UIImage imageNamed:@"result_graph_before_button_.png"];
        image1 = [UIImage imageNamed:@"result_graph_before_buttonover_.png"];
        
        y = (RESULT_TABLE_ROW - image0.size.height) / 2;
        
        _buttonLeft = [UIButton buttonWithType:UIButtonTypeCustom];
        _buttonLeft.frame = CGRectMake(_imageViewMain.frame.origin.x - image0.size.width, y, image0.size.width, image0.size.height);
        [_buttonLeft setImage:image0 forState:UIControlStateNormal];
        [_buttonLeft setImage:image1 forState:UIControlStateHighlighted];
        [_buttonLeft addTarget:self action:@selector(clickBefore:) forControlEvents:UIControlEventTouchUpInside];
        [_viewBack addSubview:_buttonLeft];
        
        image0 = [UIImage imageNamed:@"result_graph_next_button_.png"];
        image1 = [UIImage imageNamed:@"result_graph_next_buttonover_.png"];
        _buttonRight = [UIButton buttonWithType:UIButtonTypeCustom];
        _buttonRight.frame = CGRectMake(_imageViewMain.frame.origin.x + _imageViewMain.frame.size.width, y, image0.size.width, image0.size.height);
        [_buttonRight setImage:image0 forState:UIControlStateNormal];
        [_buttonRight setImage:image1 forState:UIControlStateHighlighted];
        [_buttonRight addTarget:self action:@selector(clickNext:) forControlEvents:UIControlEventTouchUpInside];
        [_viewBack addSubview:_buttonRight];
        
        self.type = GraphTypeDay;
        
        [self.contentView addSubview:_viewBack];
        
    }
    return self;
}

- (void)drawRect:(CGRect)rect
{
    // Drawing code
}

- (void)dealloc{
    
    [_viewBack release];
    [super dealloc];
}

- (void)resetRect:(CGRect)rect{
    self.viewBack.frame = rect;
    self.imageViewMain.center = self.viewBack.center;
    
    CGRect r = self.buttonLeft.frame;
    
    int y = (rect.size.height - r.size.height) / 2;
    
    self.buttonLeft.frame = CGRectMake(_imageViewMain.frame.origin.x - r.size.width, y, r.size.width, r.size.height);
    self.buttonRight.frame = CGRectMake(_imageViewMain.frame.origin.x + _imageViewMain.frame.size.width, r.origin.y, r.size.width, r.size.height);
}


#pragma mark - set property

- (void)setType:(GraphType)type{
    _type = type;
    switch (type) {
        case GraphTypeDay:
            _imageViewMain.image = [UIImage imageNamed:@"result_graph_daily_.png"];
            break;
        case GraphTypeMonth:
            _imageViewMain.image = [UIImage imageNamed:@"result_graph_monthly_.png"];
            break;
        case GraphTypeQuarter:
            _imageViewMain.image = [UIImage imageNamed:@"result_graph_quarter_.png"];
            break;
        case GraphTypeHalf:
            _imageViewMain.image = [UIImage imageNamed:@"result_graph_half_.png"];
            break;
        case GraphTypeYear:
            _imageViewMain.image = [UIImage imageNamed:@"result_graph_yearly_.png"];
            break;
    }
}

#pragma mark - Button Event

- (void)clickBefore:(id)sender{
    
    if(self.type == GraphTypeDay){
        self.type = GraphTypeYear;
    }else{
        self.type--;
    }
    
    CATransition *animation = [CATransition animation];
    [animation setDelegate:self];
    [animation setType:kCATransitionPush];
    [animation setSubtype:kCATransitionFromLeft];
    [animation setDuration:0.3f];
    [animation setTimingFunction:[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut]];
    
    [[self.imageViewMain layer] addAnimation:animation forKey:@"View Change Ani"];
    
}

- (void)clickNext:(id)sender{
    
    if(self.type == GraphTypeYear){
        self.type = GraphTypeDay;
    }else{
        self.type++;
    }
    
    CATransition *animation = [CATransition animation];
    [animation setDelegate:self];
    [animation setType:kCATransitionPush];
    [animation setSubtype:kCATransitionFromRight];
    [animation setDuration:0.3f];
    [animation setTimingFunction:[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut]];
    
    [[self.imageViewMain layer] addAnimation:animation forKey:@"View Change Ani"];
}


@end
