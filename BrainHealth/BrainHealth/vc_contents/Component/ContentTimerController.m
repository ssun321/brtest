//
//  ContentTimerController.m
//  BrainHealthTest
//
//  Created by Mir on 13. 4. 29..
//  Copyright (c) 2013년 Mir. All rights reserved.
//

#import "ContentTimerController.h"


@interface ContentTimerController ()

@end

@implementation ContentTimerController

@synthesize delegate = _delegate;
@synthesize limitTime = _limitTime;
@synthesize currentTime = _currentTime;

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
	[_timeLabel release];
	
	[super dealloc];
}

- (void)updateTimer{
	//update label
	_timeLabel.text = [NSString stringWithFormat:@"%d", _currentTime];
	
	//update img (width 300px)
	int width = 300 * _currentTime/_limitTime;
	[_barImageView setFrame:CGRectMake(_barImageView.frame.origin.x,
									   _barImageView.frame.origin.y,
									   width,
									   _barImageView.frame.size.height)];
	
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
			_barImageView.hidden = FALSE;
			_timeLabel.frame = CGRectMake(29.0f, 0.0f,
										  _timeLabel.frame.size.width,
										  _timeLabel.frame.size.height);
			break;
			
		case TimerViewTypeOnlyText:
			_barImageView.hidden = TRUE;
			_timeLabel.frame = CGRectMake(180.0f, 0.0f,
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
};


@end
