//
//  ContentTimerController.m
//  BrainHealthTest
//
//  Created by Mir on 13. 4. 29..
//  Copyright (c) 2013년 Mir. All rights reserved.
//

#import "ContentTimerController.h"

#import "ContentCommon.h"

@interface ContentTimerController ()

@end

@implementation ContentTimerController

@synthesize delegate = _delegate;
@synthesize limitTime = _limitTime;
@synthesize currentTime = _currentTime;
@synthesize playerSound = _playerSound;

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
	[_backgroundImageView release];
	[_barImageView release];
	[_maskImageView release];
	[_OnlyTextBackGroundImagView release];
	[_timeLabel release];
	
	if (_playerSound) {
		_playerSound.delegate = nil;
		if(_playerSound.playing){
			[_playerSound stop];
		}
		[self setPlayerSound:nil];
	}
	
	[super dealloc];
}

- (void)updateTimer{
	//update label
	_timeLabel.text = [NSString stringWithFormat:@"%d", _currentTime];
	
	//update img
	int width = _barImageView.frame.size.width * _currentTime/_limitTime;
	[_barImageView setFrame:CGRectMake(401.0f - (_barImageView.frame.size.width - width),
									   _barImageView.frame.origin.y,
									   _barImageView.frame.size.width,
									   _barImageView.frame.size.height)];
	
	//시간재촉
	if (_currentTime == 5) {
		
		//효과음이 있는가 없는가
		if (BHContentInfo.setting_sound) {
			
			NSString *file = @"endtimer";
			NSString *path = [[NSBundle mainBundle] pathForResource:file ofType:@"aif"];;
			NSURL *url = [NSURL fileURLWithPath:path];;
			
			AVAudioPlayer *av = [[AVAudioPlayer alloc] initWithContentsOfURL:url error:NULL];
			av.delegate = self;
			[self setPlayerSound:av];
			[av release];
			[av play];
		}
	}
	
	//시간종료
	if (_currentTime == 0) {
		if (_delegate && [_delegate respondsToSelector:@selector(didEndTimerWithContentTimerController)]) {
			[_delegate didEndTimerWithContentTimerController];
		}
	}
}

- (void)changeTimer{
	
	if (_currentTime > 0) {
		_currentTime -= 1;
		[self performSelector:@selector(changeTimer) withObject:nil afterDelay:1.0f];
	}
	[self updateTimer];
}

- (void)setLimitTime:(int)limitTime{
	_limitTime = limitTime;
	_currentTime = limitTime;
	
	[self updateTimer];
}

- (void)reloadTimerViewType:(TimerViewType)timerViewType{
	_timerViewType = timerViewType;
	
	//update UI
	switch (_timerViewType) {
		case TimerViewTypeDefault:
			_backgroundImageView.hidden			= FALSE;
			_barImageView.hidden				= FALSE;
			_maskImageView.hidden				= FALSE;
			_OnlyTextBackGroundImagView.hidden	= TRUE;
			_timeLabel.frame = CGRectMake(335.0f, 9.0f,
										  _timeLabel.frame.size.width,
										  _timeLabel.frame.size.height);
			break;
			
		case TimerViewTypeOnlyText:
			_backgroundImageView.hidden			= TRUE;
			_barImageView.hidden				= TRUE;
			_maskImageView.hidden				= TRUE;
			_OnlyTextBackGroundImagView.hidden	= FALSE;
			_timeLabel.frame = CGRectMake(485.0f, 8.0f,
										  _timeLabel.frame.size.width,
										  _timeLabel.frame.size.height);
			break;
			
		default:
			break;
	}
};

- (void)startTimerController{
	[self performSelector:@selector(changeTimer) withObject:nil afterDelay:1.0f];
};

- (void)stopTimerController{
	[NSObject cancelPreviousPerformRequestsWithTarget:self];
	
	if (_playerSound) {
		_playerSound.delegate = nil;
		if(_playerSound.playing){
			[_playerSound stop];
		}
		[self setPlayerSound:nil];
	}
};

#pragma mark - AVAudioPlayerDelegate
- (void)audioPlayerDidFinishPlaying:(AVAudioPlayer *)player successfully:(BOOL)flag{
	
	if (flag) {
		player.delegate = nil;
		[self setPlayerSound:nil];
	}
}

@end
