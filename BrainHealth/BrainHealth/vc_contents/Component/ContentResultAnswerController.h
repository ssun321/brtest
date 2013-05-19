//
//  ContentResultAnswerController.h
//  BrainHealthTest
//
//  Created by Mir on 13. 4. 29..
//  Copyright (c) 2013년 Mir. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h>

@protocol ContentResultAnswerControllerDelegate;

@interface ContentResultAnswerController : UIViewController<AVAudioPlayerDelegate>{
	
	id <ContentResultAnswerControllerDelegate> _delegate;
	AVAudioPlayer* _playerSound;
	
	IBOutlet UIImageView *_resultImageView;
}

@property(nonatomic, assign)id /*<ContentResultAnswerController> 약한참조*/ delegate;
@property(nonatomic, retain) AVAudioPlayer* playerSound;

- (void)reloadResultAnswer:(BOOL)isRight;
- (IBAction)touchUpInsideWith:(id)sender;

@end



#pragma mark - ContentResultAnswerControllerDelegate
@protocol ContentResultAnswerControllerDelegate <NSObject>
@required
- (void)didTouchWithResultAnswerController:(ContentResultAnswerController *)resultAnswerController;
@end