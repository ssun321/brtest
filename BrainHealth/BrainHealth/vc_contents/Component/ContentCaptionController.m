//
//  ContentCaptionController.m
//  BrainHealthTest
//
//  Created by Mir on 13. 4. 22..
//  Copyright (c) 2013년 Mir. All rights reserved.
//

#import "ContentCaptionController.h"

#import "ContentCommon.h"

@interface ContentCaptionController ()

@end

@implementation ContentCaptionController

@synthesize playerNarration = _playerNarration;
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
	if (_playerNarration) {
		_playerNarration.delegate = nil;
		if(_playerNarration.playing)
			[_playerNarration stop];
		[self setPlayerNarration:nil];
	}
	
	[super dealloc];
}

- (void)makeContentCaptionWith:(NSString *)contentSeq contentDiversion:(NSString *)contentDiv{
	
	//지문이 있는가 없는가
	if (BHContentInfo.setting_caption) {
		_captionLabel.text = [BHContentInfo captionWithSeq:contentSeq Diversion:contentDiv];
		_startButton.frame = CGRectMake(_startButton.frame.origin.x, 130.0f, _startButton.frame.size.width, _startButton.frame.size.height);
	}
	else{
		_captionLabel.text = @"";
		_startButton.frame = CGRectMake(_startButton.frame.origin.x, (_captionView.frame.size.height -_startButton.frame.size.height)/2, _startButton.frame.size.width, _startButton.frame.size.height);
	}
	
	//음성이 있는가 없는가
	if (BHContentInfo.setting_narration) {
		
		NSString *file = [BHContentInfo narrationWithSeq:contentSeq Diversion:contentDiv];
		NSString *path = [[NSBundle mainBundle] pathForResource:file ofType:@"mp3"];;
		NSURL *url = [NSURL fileURLWithPath:path];;
		
		AVAudioPlayer *av = [[AVAudioPlayer alloc] initWithContentsOfURL:url error:NULL];
		av.delegate = self;
		[self setPlayerNarration:av];
		[av release];
		[av play];
	}
};

- (IBAction)touchUpInsideWith:(id)sender{
	
	//BaseViewController에 요청.
	if (_delegate && [_delegate respondsToSelector:@selector(didStartContentWithContentCaptionController:)]) {
		
		if (_playerNarration) {
			_playerNarration.delegate = nil;
			if(_playerNarration.playing)
				[_playerNarration stop];
			[self setPlayerNarration:nil];
		}
		
		[_delegate didStartContentWithContentCaptionController:self];
	}
};

#pragma mark - AVAudioPlayerDelegate
- (void)audioPlayerDidFinishPlaying:(AVAudioPlayer *)player successfully:(BOOL)flag{
	
	if (flag) {
		_playerNarration.delegate = nil;
		[self setPlayerNarration:nil];
	}
}

@end
