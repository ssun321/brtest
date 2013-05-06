//
//  ContentResultAnswerController.h
//  BrainHealthTest
//
//  Created by Mir on 13. 4. 29..
//  Copyright (c) 2013년 Mir. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol ContentResultAnswerControllerDelegate;

@interface ContentResultAnswerController : UIViewController{
	
	id <ContentResultAnswerControllerDelegate> _delegate;
	
	IBOutlet UIImageView *_resultImageView;
}

@property(nonatomic, assign)id /*<ContentResultAnswerController> 약한참조*/ delegate;

- (void)reloadResultAnswer:(BOOL)isRight;
- (IBAction)touchUpInsideWith:(id)sender;

@end



#pragma mark - ContentResultAnswerControllerDelegate
@protocol ContentResultAnswerControllerDelegate <NSObject>
@required
- (void)didTouchWithResultAnswerController:(ContentResultAnswerController *)resultAnswerController;
@end