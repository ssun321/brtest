//
//  PairComposition.m
//  BrainHealthTest
//
//  Created by kimwd on 13. 5. 2..
//  Copyright (c) 2013년 Mir. All rights reserved.
//

#import "PairComposition.h"
#import "ContentCommon.h"

#define EXAMPLE_026_HEADER  @"ex"
#define QUESTION_026_HEADER  @"q"

#define QUESTION_016_HEADER_L  @"l"
#define QUESTION_016_HEADER_R  @"r"


@interface PairComposition()

@property (nonatomic, retain) NSMutableArray* arExampleImage;       // 보기 정보 배열
@property (nonatomic, retain) NSMutableArray* arQuestionImage;      // 문제 정보 배열
@property (nonatomic, retain) NSMutableArray* arCorrectAnsewer;     // 정답 정보 배열

@property (nonatomic, assign) int countUserAnsewer;              // 사용자가 맞춘 정답 개수
@end

@implementation PairComposition

#pragma mark - Life Cycle
- (id)init {
    if ( self = [super init] ) {
        self.countUserAnsewer = 0;
    }
    return self;
}

- (void)dealloc {
    [super dealloc];
}

#pragma mark - Load Content 026
// 같은그림찾기 보기 이미지 로드
- (NSMutableArray*)loadExamlpleImageWithType:(NSString*)type WithCount:(int)count {
    
    self.arExampleImage = [NSMutableArray arrayWithCapacity:count];
    NSMutableArray* arImageNumber = [BHContentUtil randomArrayWithMinValue:0 MaxValue:[BHContentUtil imageTotalCountWithType:type]-1 count:count];
    
    int imgNumber = 0;
    for ( int i = 0; i < [arImageNumber count]; i++ ) {
        imgNumber = [[arImageNumber objectAtIndex:i] intValue];
        [self.arExampleImage addObject:[NSString stringWithFormat:@"%@_%@_%02d_.png", EXAMPLE_026_HEADER, type, imgNumber]];
    }
    return self.arExampleImage;
}

// 같은그림찾기 문제 이미지 로드 및 정답 배열 구성
- (NSMutableArray*)loadQuestionImageWithType:(NSString*)type WithCount:(int)count {
    self.arQuestionImage = [NSMutableArray arrayWithCapacity:count];
    self.arCorrectAnsewer = [NSMutableArray arrayWithCapacity:count];

    
    NSMutableArray* arImageNumber = [BHContentUtil randomArrayWithMinValue:0 MaxValue:[self.arExampleImage count]-1 count:count];
    
    int imgIndex = 0;
    NSString* strImage;
    for ( int i = 0; i < [arImageNumber count]; i++ ) {
        imgIndex = [[arImageNumber objectAtIndex:i] intValue];
        [self.arCorrectAnsewer addObject:[NSNumber numberWithInt:imgIndex]];
        strImage = [[self.arExampleImage objectAtIndex:imgIndex] stringByReplacingOccurrencesOfString:EXAMPLE_026_HEADER withString:QUESTION_026_HEADER];
        [self.arQuestionImage addObject:strImage];
    }
    return self.arQuestionImage;
}
#pragma mark - Load Content 016 
// 왼손/오른손 문제 이미지 로드 및 정답 배열 구성
- (NSMutableArray*)load016QuestionImageWithType:(NSString*)type level:(NSString*)level WithCount:(int)count {

    // 현재 사용가능한 이미지 패턴
    int lastExamplePattern = 5;

    int contentLv = [level intValue];
    
    int correctCount = count/4; // 정답 개수
    if ( count%4 != 0) {
        correctCount = correctCount * (count%4);
    }
    
    self.arQuestionImage = [NSMutableArray arrayWithCapacity:count];
    self.arCorrectAnsewer = [NSMutableArray arrayWithCapacity:correctCount];
    
    NSString* strExHeader;
    NSString* strCorrectHeader;
    
    // 왼손 찾기
    if ( [self isRandomYesOrNo] ) {
        strExHeader = QUESTION_016_HEADER_R;
        strCorrectHeader = QUESTION_016_HEADER_L;
    }
    // 오른손 찾기
    else {
        strExHeader = QUESTION_016_HEADER_L;
        strCorrectHeader = QUESTION_016_HEADER_R;
    }
    
//    _016_00_.png - 선 이미지
//    _016_01_.png - 명암 이미지
//    _016_02_.png - 채색 이미지
    
    NSString* strImage;
    switch ( contentLv ) {
        // level 1 - 전체 4개 (count)의 채색된 이미지 중 1개만 정답
        // level 2 - 전체 6개 (count)의 채색된 이미지 중 2개만 정답
        case 1: case 2: {
            NSMutableArray* arExampleNumber = [BHContentUtil randomArrayWithMinValue:0 MaxValue:lastExamplePattern count:count];
            NSMutableArray* arCorrectIndex = [BHContentUtil randomArrayWithMinValue:0 MaxValue:[arExampleNumber count]-1 count:correctCount];
            NSNumber* tempNumber;
            for ( int i = 0; i < [arExampleNumber count]; i++ ) {
                tempNumber = [arExampleNumber objectAtIndex:i];
                
                strImage = [NSString stringWithFormat:@"%@_%@_%d2_.png",strExHeader, type, [tempNumber intValue]];
                
                if ( [arCorrectIndex containsObject:[NSNumber numberWithInt:i]] ) {
                    strImage = [NSString stringWithFormat:@"%@_%@_%d2_.png",strCorrectHeader, type, [tempNumber intValue]];
                    [self.arCorrectAnsewer addObject:[NSNumber numberWithInt:i]];
                }
                [self.arQuestionImage addObject:strImage];
                NSLog(@"Image Name : %@", strImage);
            }
            break;
        }
        // level 3 - 전체 8개의 선 이미지 중 2개만 정답
        // level 4 - 전체 12개의 선 이미지 중 3개만 정답
        case 3: case 4: {
            NSMutableArray* arExampleNumber = [BHContentUtil randomArrayWithMinValue:0 MaxValue:lastExamplePattern count:lastExamplePattern+1];
            NSMutableArray* arCorrectIndex = [BHContentUtil randomArrayWithMinValue:0 MaxValue:[arExampleNumber count]-1 count:correctCount];
            [arExampleNumber addObjectsFromArray:[BHContentUtil randomArrayWithMinValue:0 MaxValue:lastExamplePattern count:count-[arExampleNumber count]]];

            NSNumber* tempNumber;
            for ( int i = 0; i < [arExampleNumber count]; i++ ) {
                tempNumber = [arExampleNumber objectAtIndex:i];
                
                strImage = [NSString stringWithFormat:@"%@_%@_%d0_.png",strExHeader, type, [tempNumber intValue]];
                
                if ( [arCorrectIndex containsObject:[NSNumber numberWithInt:i]] ) {
                    strImage = [NSString stringWithFormat:@"%@_%@_%d0_.png",strCorrectHeader, type, [tempNumber intValue]];
                    [self.arCorrectAnsewer addObject:[NSNumber numberWithInt:i]];
                }
                [self.arQuestionImage addObject:strImage];
            }
            break;
        }
        // level 5 - 전체 16개 선/명암 이미지 중 4개만 정답
        case 5: {
            NSNumber* tempNumber;
            
            NSMutableArray* arExampleNumber = [BHContentUtil randomArrayWithMinValue:0 MaxValue:lastExamplePattern count:lastExamplePattern+1];
            [arExampleNumber addObjectsFromArray:[BHContentUtil randomArrayWithMinValue:0 MaxValue:lastExamplePattern count:[arExampleNumber count]]];
            
            NSMutableArray* arShadowNumber = [BHContentUtil randomArrayWithMinValue:0 MaxValue:lastExamplePattern count:4];
            NSMutableArray* arShadowIndex = [BHContentUtil randomArrayWithMinValue:0 MaxValue:[arExampleNumber count]-1 count:4];
            for (int i = 0; i < [arShadowIndex count]; i++ ) {
                tempNumber = [arShadowIndex objectAtIndex:i];
                [arExampleNumber insertObject:[arShadowNumber objectAtIndex:i] atIndex:[tempNumber intValue]];
            }
            
            NSMutableArray* arCorrectIndex = [BHContentUtil randomArrayWithMinValue:0 MaxValue:count-1 count:correctCount];
            NSString* imgType;
            for ( int i = 0; i < [arExampleNumber count]; i++ ) {
                imgType = @"0";
                tempNumber = [arExampleNumber objectAtIndex:i];

                if ( [arShadowIndex containsObject:[NSNumber numberWithInt:i]] ) {
                    imgType = @"1";
                }
                    
                strImage = [NSString stringWithFormat:@"%@_%@_%d%@_.png",strExHeader, type, [tempNumber intValue], imgType];
                if ( [arCorrectIndex containsObject:[NSNumber numberWithInt:i]] ) {
                    strImage = [NSString stringWithFormat:@"%@_%@_%d%@_.png",strCorrectHeader, type, [tempNumber intValue], imgType];
                    [self.arCorrectAnsewer addObject:[NSNumber numberWithInt:i]];
                }
                [self.arQuestionImage addObject:strImage];
            }
            break;
        }
    }
    return self.arQuestionImage;
}



// +/- 랜덤 부호, 왼손/오른손 Random 처리를 위한 Yes or No 설정
- (BOOL)isRandomYesOrNo {
    int randNum = arc4random();
    // 0으로 나누어지면 +/왼손, 나누어지지 않으면 -/오른손
    if ( randNum % 2 == 0 )     return YES;
    else                        return NO;
}


// 같은그림찾기 정답 
- (BOOL)isCorrectQuestionWithIndex:(int)index {
    BOOL isCorrect = NO;
    
    if ( [self.arCorrectAnsewer containsObject:[NSNumber numberWithInt:index]] ) {
        isCorrect = YES;
        self.countUserAnsewer++;
    }
    return isCorrect;
}

// 정답 개수와 사용자가 맞춘 개수 비교
- (BOOL)isAllCorrectAnswer {
    
    int correctAnswerCount = [self.arCorrectAnsewer count];
    
    if ( self.countUserAnsewer == correctAnswerCount )
        return YES;
    else
        return NO;
}

// 정답 배열 반환 처리
- (NSMutableArray*)getCorrectAnsewer {
    return self.arCorrectAnsewer;
}

@end
