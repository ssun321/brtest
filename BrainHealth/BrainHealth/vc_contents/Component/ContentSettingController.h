//
//  ContentSettingController.h
//  BrainHealth
//
//  Created by Mir on 13. 5. 12..
//  Copyright (c) 2013년 Tim. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol ContentSettingControllerDelegate;

@interface ContentSettingController : UIViewController{
	
	IBOutlet UISwitch	*_switchNarration;
	IBOutlet UISwitch	*_switchCaption;
	IBOutlet UISwitch	*_switchTimer;
	IBOutlet UISwitch	*_switchSound;
	
	id <ContentSettingControllerDelegate> _delegate;
}

@property(nonatomic, assign)id /*<ContentSettingControllerDelegate> 약한참조*/ delegate;

- (IBAction)touchUpInsideWithConfirm:(UIButton *)sender;
- (IBAction)touchUpInsideWithCancel:(UIButton *)sender;
- (IBAction)touchUpInsideWithSwitchSwitchs:(UISwitch *)sender;

@end


#pragma mark - ContentSettingControllerDelegate
@protocol ContentSettingControllerDelegate <NSObject>
@required
- (void)didConfirmWithContentSettingController:(ContentSettingController *)settingController;
- (void)didCancelWithContentSettingController:(ContentSettingController *)settingController;
@end