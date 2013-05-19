//
//  BaseViewController.h
//  BrainHealthTest
//
//  Created by Mir on 13. 4. 10..
//  Copyright (c) 2013년 Mir. All rights reserved.
//

#import <UIKit/UIKit.h>

@class ContentTimerController;
@protocol FlowViewControllerDelegate;

@interface BaseViewController : UIViewController <UIAlertViewDelegate>{
	
	NSString *_contentSeq;		//문제 고유번호 (_contentType + _contentLevel)
	NSString *_contentType;		//문제 유형
	NSString *_contentLevel;	//문제 난이도
	NSString *_contentDiversion;//문제 변환식 (왼손, 오른손 문제처럼 특정 문제들은 같은 유형-난이도 속에서도 분기를 탄다)
	
	//타이머
	ContentTimerController	*_timerController;
	
	//실제 컨텐츠가 붙을 영역
	UIView *_contentsView;
	
	//상단
	UIView		*_baseTopView;
	UIButton	*_baseMenuButton;		//메뉴버튼
	UIButton	*_baseSettingButton;	//설정버튼
	
	//하단
	UIView		*_baseBottomView;
	UILabel		*_baseSubjectLabel;		//컨텐츠 제목
	UILabel		*_baseCountLabel;		//컨텐츠 진행도(index/count)
	
	id <FlowViewControllerDelegate> _delegate;
}

@property(nonatomic, retain)NSString *contentSeq;
@property(nonatomic, retain)NSString *contentType;
@property(nonatomic, retain)NSString *contentLevel;
@property(nonatomic, retain)NSString *contentDiversion;

@property(nonatomic, assign)id /*<FlowViewControllerDelegate> 약한참조*/ delegate;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil level:(NSString *)strLevelOrNil;
- (void)startTimer;
- (void)stopTimer;
- (void)resultAnswer:(BOOL)isRight;

#pragma mark - required overwrite method
//생성자(savedDic : 기존에 저장된 문제 설정값들, 공통 화면 생성 후 요청됨)
- (void)makeQuestionWithDic:(NSDictionary *)savedDic;

#pragma mark - required overwrite method
//실행자('시작' 버튼 누르면 요청됨)
- (void)execute;

@end





#pragma mark - FlowViewControllerDelegate
@protocol FlowViewControllerDelegate <NSObject>
- (void)next;
- (void)goToMainMenu;
@end
