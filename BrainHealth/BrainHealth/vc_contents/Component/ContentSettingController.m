//
//  ContentSettingController.m
//  BrainHealth
//
//  Created by Mir on 13. 5. 12..
//  Copyright (c) 2013년 Tim. All rights reserved.
//

#import "ContentSettingController.h"

#import "ContentCommon.h"

@interface ContentSettingController ()

@end

@implementation ContentSettingController

@synthesize delegate = _delegate;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
	
	_switchNarration.on = BHContentInfo.setting_narration;
	_switchCaption.on	= BHContentInfo.setting_caption;
	_switchSound.on		= BHContentInfo.setting_sound;
	_switchTimer.on		= BHContentInfo.setting_timer;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)touchUpInsideWithConfirm:(UIButton *)sender{
	
	if (_delegate && [_delegate respondsToSelector:@selector(didConfirmWithContentSettingController:)]) {
		[_delegate didConfirmWithContentSettingController:self];
	}
};

- (IBAction)touchUpInsideWithCancel:(UIButton *)sender{
	
	if (_delegate && [_delegate respondsToSelector:@selector(didCancelWithContentSettingController:)]) {
		[_delegate didCancelWithContentSettingController:self];
	}
};

- (IBAction)touchUpInsideWithSwitchSwitchs:(UISwitch *)sender{
	
	if (sender == _switchNarration) {
		[BHContentInfo setSetting_narration:sender.on];
	}
	else if (sender == _switchCaption) {
		[BHContentInfo setSetting_caption:sender.on];
	}
	else if (sender == _switchSound) {
		[BHContentInfo setSetting_sound:sender.on];
	}
	else if (sender == _switchTimer) {
		[BHContentInfo setSetting_timer:sender.on];
	}
};


@end
