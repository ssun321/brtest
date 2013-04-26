//
//  GraphView.m
//  BrainHealth
//
//  Created by timzero on 13. 4. 26..
//  Copyright (c) 2013년 Tim. All rights reserved.
//

#import <QuartzCore/QuartzCore.h>

#import "GraphView.h"
#import "GraphCell.h"

@implementation GraphView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        self.backgroundColor = [UIColor clearColor];
        
        UIImage* image = [UIImage imageNamed:@"result_graph_contents_01_.png"];
        _imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, image.size.width, image.size.height)];
        _imageView.center = CGPointMake(self.frame.size.width / 2, self.frame.size.height / 2);
        [self addSubview:_imageView];
        
        int y = 0;
        y = self.frame.size.height - 40;
        
        _button = [UIButton buttonWithType:UIButtonTypeCustom];
        _button.frame = CGRectMake(_imageView.frame.origin.x, y, _imageView.frame.size.width, _imageView.frame.size.height - y);
        _button.backgroundColor = [UIColor colorWithRed:1 green:0 blue:0 alpha:0.5];
        [self addSubview:_button];
        
    }
    return self;
}

- (void)drawRect:(CGRect)rect
{
    // Drawing code
}

- (void)dealloc{
    
    [_imageView release];
    [super dealloc];
}



#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 10;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    GraphCell* cell = nil;
    cell = [tableView dequeueReusableCellWithIdentifier:@"GraphCell"];
    if(cell == nil){
        cell = [[GraphCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"GraphCell"];
    }
    return cell;
}

#pragma mark - UITableViewDelegate

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 291;
}

@end
