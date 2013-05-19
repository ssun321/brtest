//
//  ContentCaptionController.h
//  BrainHealthTest
//
//  Created by Mir on 13. 4. 22..
//  Copyright (c) 2013년 Mir. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h>

@protocol ContentCaptionControllerDelegate;

@interface ContentCaptionController : UIViewController<AVAudioPlayerDelegate>{
	IBOutlet UIView		*_dimmView;
	IBOutlet UIView		*_captionView;
	IBOutlet UILabel	*_captionLabel;
	IBOutlet UIButton	*_startButton;
	
	AVAudioPlayer* _playerNarration;
	
	id <ContentCaptionControllerDelegate> _delegate;
}
@property(nonatomic, retain) AVAudioPlayer* playerNarration;
@property(nonatomic, assign)id /*<ContentCaptionControllerDelegate> 약한참조*/ delegate;

- (void)makeContentCaptionWith:(NSString *)contentSeq contentDiversion:(NSString *)contentDiv;
- (IBAction)touchUpInsideWith:(id)sender;

@end




#pragma mark - ContentCaptionControllerDelegate
@protocol ContentCaptionControllerDelegate <NSObject>
@required
- (void)didStartContentWithContentCaptionController:(ContentCaptionController *)captionController;
@end