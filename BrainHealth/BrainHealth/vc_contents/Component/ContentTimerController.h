//
//  ContentTimerController.h
//  BrainHealthTest
//
//  Created by Mir on 13. 4. 29..
//  Copyright (c) 2013년 Mir. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h>

enum TimerViewType{
    TimerViewTypeDefault = 0,	// bar img
    TimerViewTypeOnlyText,		// only text
};
typedef enum TimerViewType TimerViewType;

@protocol ContentTimerControllerDelegate;

@interface ContentTimerController : UIViewController<AVAudioPlayerDelegate>{
	
	int _limitTime;
	int _currentTime;
	TimerViewType _timerViewType;
	id <ContentTimerControllerDelegate> _delegate;
	AVAudioPlayer* _playerSound;
	
	IBOutlet UIImageView *_backgroundImageView;
	IBOutlet UIImageView *_barImageView;
	IBOutlet UIImageView *_maskImageView;
	IBOutlet UIImageView *_OnlyTextBackGroundImagView;
	IBOutlet UILabel *_timeLabel;
}
@property(nonatomic, assign)id /*<ContentTimerControllerDelegate> 약한참조*/ delegate;
@property(nonatomic, assign)int limitTime;
@property(nonatomic, assign)int currentTime;
@property(nonatomic, retain) AVAudioPlayer* playerSound;

- (void)reloadTimerViewType:(TimerViewType)timerViewType;
- (void)startTimerController;
- (void)stopTimerController;

@end



#pragma mark - ContentTimerControllerDelegate
@protocol ContentTimerControllerDelegate <NSObject>
@required
- (void)didEndTimerWithContentTimerController;
@end