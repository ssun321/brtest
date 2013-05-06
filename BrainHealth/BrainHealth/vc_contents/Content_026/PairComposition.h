//
//  PairComposition.h
//  BrainHealthTest
//
//  Created by kimwd on 13. 5. 2..
//  Copyright (c) 2013년 Mir. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface PairComposition : NSObject


- (BOOL)isAllCorrectAnswer;                                                         // 정답 개수와 사용자가 맞춘 개수 비교
- (BOOL)isRandomYesOrNo;                                                            // +/- 랜덤 부호, 왼손/오른손 Random 처리를 위한 Yes or No 설정
- (NSMutableArray*)getCorrectAnsewer;                                               // 정답 배열 반환 처리
- (BOOL)isCorrectQuestionWithIndex:(int)index;                                      // 정답확인 처리
// 026 문제 관련 함수
- (NSMutableArray*)loadExamlpleImageWithType:(NSString*)type WithCount:(int)count;  // 보기 이미지 로드
- (NSMutableArray*)loadQuestionImageWithType:(NSString*)type WithCount:(int)count;  // 문제 이미지 로드

// 016 문제 관련 함수
- (NSMutableArray*)load016QuestionImageWithType:(NSString*)type level:(NSString*)level WithCount:(int)count;
@end
