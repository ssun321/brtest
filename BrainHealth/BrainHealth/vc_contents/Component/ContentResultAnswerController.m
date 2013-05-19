//
//  ContentResultAnswerController.m
//  BrainHealthTest
//
//  Created by Mir on 13. 4. 29..
//  Copyright (c) 2013년 Mir. All rights reserved.
//

#import "ContentResultAnswerController.h"

#import "ContentCommon.h"

@interface ContentResultAnswerController ()

@end

@implementation ContentResultAnswerController

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
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)dealloc{
	
	[_resultImageView release];
	
	if (_playerSound) {
		_playerSound.delegate = nil;
		if(_playerSound.playing){
			[_playerSound stop];
		}
		[self setPlayerSound:nil];
	}
	
	[super dealloc];
}

- (void)reloadResultAnswer:(BOOL)isRight{
	
	UIImage *resultImage = nil;
	
	NSString *file = nil;
	
	if (isRight) {
		file = @"good";
		resultImage = [UIImage imageNamed:@"tp_b_0_.png"];
	}
	else{
		file = @"bad";
		resultImage = [UIImage imageNamed:@"tp_b_X_.png"];
	}
	
	//효과음이 있는가 없는가
	if (BHContentInfo.setting_sound) {
		NSString *path = [[NSBundle mainBundle] pathForResource:file ofType:@"aif"];;
		NSURL *url = [NSURL fileURLWithPath:path];;
		
		AVAudioPlayer *av = [[AVAudioPlayer alloc] initWithContentsOfURL:url error:NULL];
		av.delegate = self;
		[self setPlayerSound:av];
		[av release];
		[av play];
	}
	
	//이미지 보여주기
	[_resultImageView setImage:resultImage];
};

- (IBAction)touchUpInsideWith:(id)sender{
	
	if (_delegate && [_delegate respondsToSelector:@selector(didTouchWithResultAnswerController:)]) {
		
		if (_playerSound) {
			_playerSound.delegate = nil;
			if(_playerSound.playing){
				[_playerSound stop];
			}
			[self setPlayerSound:nil];
		}
		
		[_delegate didTouchWithResultAnswerController:self];
	}
}

#pragma mark - AVAudioPlayerDelegate
- (void)audioPlayerDidFinishPlaying:(AVAudioPlayer *)player successfully:(BOOL)flag{
	
	if (flag) {
		player.delegate = nil;
		[self setPlayerSound:nil];
	}
}

@end
