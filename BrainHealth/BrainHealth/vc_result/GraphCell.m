//
//  GraphView.m
//  BrainHealth
//
//  Created by timzero on 13. 4. 26..
//  Copyright (c) 2013년 Tim. All rights reserved.
//

#import <QuartzCore/QuartzCore.h>

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
        _imageViewMain.center = CGPointMake(self.frame.size.width / 2, self.frame.size.height / 2);
        [_viewBack addSubview:_imageViewMain];
        [_imageViewMain release];
        
        UIImage* image0;
        UIImage* image1;
        UIButton* button;
        
        int y = 0;
        
        image0 = [UIImage imageNamed:@"result_graph_before_button_.png"];
        image1 = [UIImage imageNamed:@"result_graph_before_buttonover_.png"];
        
        y = (self.frame.size.height - image0.size.height) / 2;
        
        button = [UIButton buttonWithType:UIButtonTypeCustom];
        button.frame = CGRectMake(_imageViewMain.frame.origin.x - image0.size.width, y, image0.size.width, image0.size.height);
        [button setImage:image0 forState:UIControlStateNormal];
        [button setImage:image1 forState:UIControlStateHighlighted];
        [button addTarget:self action:@selector(clickBefore:) forControlEvents:UIControlEventTouchUpInside];
        [_viewBack addSubview:button];
        
        image0 = [UIImage imageNamed:@"result_graph_next_button_.png"];
        image1 = [UIImage imageNamed:@"result_graph_next_buttonover_.png"];
        button = [UIButton buttonWithType:UIButtonTypeCustom];
        button.frame = CGRectMake(_imageViewMain.frame.origin.x + _imageViewMain.frame.size.width, y, image0.size.width, image0.size.height);
        [button setImage:image0 forState:UIControlStateNormal];
        [button setImage:image1 forState:UIControlStateHighlighted];
        [button addTarget:self action:@selector(clickNext:) forControlEvents:UIControlEventTouchUpInside];
        [_viewBack addSubview:button];
        
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

- (void)layoutSubviews{
    
    _viewBack.frame = self.contentView.bounds;
    
    
    
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
    
    [[self.imageView layer] addAnimation:animation forKey:@"View Change Ani"];
    
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
    
    [[self.imageView layer] addAnimation:animation forKey:@"View Change Ani"];
}


@end
