//
//  ManagerCell.m
//  BrainHealth
//
//  Created by timzero on 13. 4. 29..
//  Copyright (c) 2013년 Tim. All rights reserved.
//

#import "ManagerCell.h"

@implementation ManagerCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)dealloc {
    [_labelName release];
    [_buttonA1 release];
    [_buttonA2 release];
    [_buttonA3 release];
    [_buttonB release];
    [_buttonC release];
    [_imageViewSlider release];
    [_buttonX release];
    [_labelX release];
    [_slider release];
    [super dealloc];
}
- (IBAction)clickLevel:(id)sender {
    UIButton* button = sender;
    
    NSString* title = button.titleLabel.text;
    
    if([title isEqualToString:@"A1"] || [title isEqualToString:@"A2"]){
        _buttonC.selected = _buttonB.selected = NO;
        _buttonA1.selected = _buttonA2.selected = _buttonA3.selected = YES;
        
        _slider.strLeft = @"A1";
        _slider.strCenter = @"A2";
        _slider.strRight = @"A3";
        
    }else if([title isEqualToString:@"A3"]){
        _buttonA1.selected = _buttonC.selected = NO;
        _buttonA2.selected = _buttonA3.selected = _buttonB.selected = YES;
        
        _slider.strLeft = @"A2";
        _slider.strCenter = @"A3";
        _slider.strRight = @"B";
    }else if([title isEqualToString:@"B"] || [title isEqualToString:@"C"]){
        _buttonA1.selected = _buttonA2.selected = NO;
        _buttonA3.selected = _buttonB.selected = _buttonC.selected = YES;
        
        _slider.strLeft = @"A3";
        _slider.strCenter = @"B";
        _slider.strRight = @"C";
    }
    
}

- (IBAction)clickX:(id)sender {
    UIButton* button = sender;
    NSString* title = button.titleLabel.text;
    
    if([title isEqualToString:@"X1"]){
        [button setTitle:@"X2" forState:UIControlStateNormal];
        self.labelX.text = @"10";
    }else if([title isEqualToString:@"X2"]){
        [button setTitle:@"X3" forState:UIControlStateNormal];
        self.labelX.text = @"15";
    }else if([title isEqualToString:@"X3"]){
        [button setTitle:@"X4" forState:UIControlStateNormal];
        self.labelX.text = @"20";
    }else if([title isEqualToString:@"X4"]){
        [button setTitle:@"X1" forState:UIControlStateNormal];
        self.labelX.text = @"5";
    }
    
}


@end
