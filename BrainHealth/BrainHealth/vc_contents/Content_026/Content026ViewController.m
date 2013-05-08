//
//  Content026ViewController.m
//  BrainHealthTest
//
//  Created by kimwd on 13. 4. 29..
//  Copyright (c) 2013년 Mir. All rights reserved.
//

#import "Content026ViewController.h"
#import "ContentCommon.h"
#import "PairComposition.h"

#define _TAG_VIEW_LEVEL     260000
#define _TAG_VIEW_BUTTON    260001
#define _TAG_VIEW_QUESTION  260002

@interface Content026ViewController ()
// 레벨별 문제 뷰
    @property (nonatomic, retain) IBOutlet UIView* levelView_1;
    @property (nonatomic, retain) IBOutlet UIView* levelView_2;
    @property (nonatomic, retain) IBOutlet UIView* levelView_3;
    @property (nonatomic, retain) IBOutlet UIView* levelView_4;
    @property (nonatomic, retain) IBOutlet UIView* levelView_5;

    @property (nonatomic, assign) int count;
    @property (nonatomic, assign) int correctCount;
    @property (nonatomic, retain) PairComposition* composition; // 같은그림찾기 이미지 구성
@end

@implementation Content026ViewController
#pragma mark - initialize

#pragma mark - Life Cycle
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

#pragma mark Super View Override Method
//생성자(savedDic : 기존에 저장된 문제 설정값들, 공통 화면 생성 후 요청됨)
- (void)makeQuestionWithDic:(NSDictionary *)savedDic{
	/*required overwrite*/
	
	//기존에 저장된 설정값이 있는가?
	if (savedDic) {
		
	}
    [self loadPairComposition];
    [self loadQuestionView];
    [self loadExampleImage];
    [self loadQuestionImage];
    [self rePositioningQuestionImage];
	
};

//실행자('시작' 버튼 누르면 요청됨)
- (void)execute{
	/*required overwrite*/
	
	//타이머 시작요~
	[self startTimer];
};

#pragma mark - Load View
// 레벨에 따른 문제/예제 이미지 로드
- (void)loadPairComposition {
    PairComposition* pairComposition = [[PairComposition alloc] init];
    self.composition = pairComposition;
    [pairComposition release];
}

// 레벨에 따른 화면에 표시될 뷰 로드
- (void)loadQuestionView {
    
    UIView* subView;
    switch ( [self.contentLevel intValue] ) {
        case 1:     subView = self.levelView_1;     break;
        case 2:     subView = self.levelView_2;     break;
        case 3:     subView = self.levelView_3;     break;
        case 4:     subView = self.levelView_4;     break;
        case 5:     subView = self.levelView_5;     break;
        default:    subView = self.levelView_1;     break;
    }
    [subView setTag:_TAG_VIEW_LEVEL];
    [_contentsView addSubview:subView];
}

// 문제에 해당하는 예제 이미지 로드
- (void)loadExampleImage {

    UIImage* image;
    UIView* buttonsView = [_contentsView viewWithTag:_TAG_VIEW_BUTTON];
    
    int total = [[buttonsView subviews] count];

    NSMutableArray* arImage = [self.composition loadExamlpleImageWithType:self.contentType WithCount:total];

    for (int i = 0; i < total; i++ ) {
        UIButton* button  = [[buttonsView subviews] objectAtIndex:i];
        [button setTag:i];
        image = [UIImage imageNamed:[arImage objectAtIndex:i]];
        [button setBackgroundImage:image forState:UIControlStateNormal];
        [button setBackgroundImage:image forState:UIControlStateDisabled];
    }
}

- (void)loadQuestionImage {

    UIImage* image;
    UIView* questionView = [_contentsView viewWithTag:_TAG_VIEW_QUESTION];
    int total = [[questionView subviews] count];
    
    NSMutableArray* arImage = [self.composition loadQuestionImageWithType:self.contentType  WithCount:total];
    
    for (int i = 0; i < total; i++ ) {
        UIImageView* button  = [[questionView subviews] objectAtIndex:i];
        image = [UIImage imageNamed:[arImage objectAtIndex:i]];
        [button setImage:image];
    }
}

// 레벨에 따른 문제 이미지 회전 처리
- (void)rePositioningQuestionImage {

    UIView* questionView = [_contentsView viewWithTag:_TAG_VIEW_QUESTION];
    NSArray* arImageView = [questionView subviews];
    int totalCount = [arImageView count];
    UIView* tempView;

    switch ( [self.contentLevel intValue] ) {
        case 2:
            tempView = [arImageView objectAtIndex:0];
            tempView.transform = CGAffineTransformMakeRotation(degreesToRadians(180));
            tempView = [arImageView objectAtIndex:2];
            tempView.transform = CGAffineTransformMakeRotation(degreesToRadians(90));
            break;
        case 3: {
            NSArray* arIndex = [BHContentUtil randomArrayWithMinValue:0 MaxValue:totalCount-1 count:2];
            
            for ( int i = 0; i < [arIndex count]; i++ ) {
                NSNumber* index = [arIndex objectAtIndex:i];
                tempView = [arImageView objectAtIndex:[index intValue]];
                
                tempView.transform = CGAffineTransformMakeRotation(degreesToRadians((90+(45*(i+1)))));
            }
            
            int posY;
            NSArray* arRandomIndex = [BHContentUtil randomArrayWithMinValue:0 MaxValue:totalCount-1 count:4];
            NSArray* arCoordinateIndex = [BHContentUtil randomArrayWithMinValue:1 MaxValue:65 count:4];
            
            for ( NSNumber* index in arRandomIndex ) {
                tempView = [arImageView objectAtIndex:[index intValue]];
                posY = tempView.bounds.origin.y;
                if ( [self.composition isRandomYesOrNo] ) {
                    posY += [[arCoordinateIndex objectAtIndex:[index intValue]] intValue];
                } else {
                    posY -= [[arCoordinateIndex objectAtIndex:[index intValue]] intValue];
                }
                tempView.transform = CGAffineTransformConcat(tempView.transform, CGAffineTransformMakeTranslation(0.0, posY));
            }
            break;
        }
        case 4: {
            // 전체 이미지에 90+45(랜덤) 각도 적용
            for ( int i = 0; i < totalCount; i++ ) {
                tempView = [arImageView objectAtIndex:i];
                tempView.transform = CGAffineTransformMakeRotation(degreesToRadians((90+(45*(i+1)))));
            }
            
            int posY;

            NSArray* arCoordinateIndex = [BHContentUtil randomArrayWithMinValue:1 MaxValue:65 count:1];
            tempView = [arImageView objectAtIndex:0];
            posY = tempView.bounds.origin.y;
            if ( [self.composition isRandomYesOrNo] ) {
                posY += [[arCoordinateIndex objectAtIndex:0] intValue];
            } else {
                posY -= [[arCoordinateIndex objectAtIndex:0] intValue];
            }
            tempView.transform = CGAffineTransformConcat(tempView.transform, CGAffineTransformMakeTranslation(0.0, posY));

                 
            tempView = [arImageView objectAtIndex:3];
            arCoordinateIndex = [BHContentUtil randomArrayWithMinValue:1 MaxValue:65 count:1];
            
            if ( [self.composition isRandomYesOrNo] ) {
                posY += [[arCoordinateIndex objectAtIndex:0] intValue];
            } else {
                posY -= [[arCoordinateIndex objectAtIndex:0] intValue];
            }
            tempView.transform = CGAffineTransformConcat(tempView.transform, CGAffineTransformMakeTranslation(0.0, posY));

            break;
        }
        case 5: {
            for ( int i = 0; i < totalCount; i++ ) {
                tempView = [arImageView objectAtIndex:i];
                tempView.transform = CGAffineTransformMakeRotation(degreesToRadians((90+(45*i))));
            }
            break;
        }

        default:
            break;
    }
    
}

// 예제이미지 사용자 터치 이벤트 처리 메소드
- (IBAction)exampleImageUserTouchEvent:(id)sender {
    
    UIButton* button;
    BOOL result = [self.composition isCorrectQuestionWithIndex:[sender tag]];
    NSArray* arButtons = [[_contentsView viewWithTag:_TAG_VIEW_BUTTON] subviews];

    [sender setEnabled:NO];
    [BHContentUtil answerExampleResult:result WithSuperView:sender];
    
    if ( result ) {    
        if ( [self.composition isAllCorrectAnswer] ) {
            
            NSArray* arCorrectAnswer = [self.composition getCorrectAnsewer];
            
            for ( button in arButtons ) {
                if ( [arCorrectAnswer containsObject:[NSNumber numberWithInt:[button tag]]] ) {
                    continue;
                } else {
                    if ( [button isEnabled] ) {
                        [button setEnabled:NO];
                        result = [self.composition isCorrectQuestionWithIndex:[button tag]];
                        [BHContentUtil answerExampleResult:result WithSuperView:button];
                    }
                }
            }
            [self resultAnswer:YES];
        }

    } else {
        // 1개라도 틀리면 전체 정답 및 오답 표시 및 전체 결과 함수 호출
        for ( button in arButtons ) {
            if ( [button isEnabled] ) {
                [button setEnabled:NO];
//                result = [self.composition isCorrectQuestionWithIndex:[button tag]];
//                [BHContentUtil answerExampleResult:result WithSuperView:button];
            }
        }
        [self resultAnswer:NO];
    }

}

@end
