//
//  MGFaceModelArray.m
//  LandMask
//
//  Created by 张英堂 on 16/8/17.
//  Copyright © 2016年 megvii. All rights reserved.
//

#import "MGFaceModelArray.h"

@implementation MGFaceModelArray

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.timeUsed = 0;
        self.detectRect = CGRectZero;
    }
    return self;
}

- (void)addModel:(MGFaceInfo *)model{
    [self.faceArray addObject:model];
}

- (MGFaceInfo *)modelWithIndex:(NSUInteger)index{
    MGFaceInfo *model = [self.faceArray objectAtIndex:index];

    return model;
}

-(NSMutableArray<MGFaceInfo *> *)faceArray{
    if (!_faceArray) {
        _faceArray = [NSMutableArray arrayWithCapacity:5];
    }
    return _faceArray;
}

-(NSUInteger)count{
    return self.faceArray.count;
}

- (NSString *)getDebugString{
    
    NSMutableString *tempString = [NSMutableString string];
    [tempString appendFormat:@"%@:%.2f ms", NSLocalizedString(@"debug_message4", nil) ,self.timeUsed];
    [tempString appendFormat:@"\n%@:%.2f ms", NSLocalizedString(@"debug_message5", nil) ,self.AttributeTimeUsed];
    
    NSMutableString *conficeString = [NSMutableString string];

    if (self.count >= 1) {
        MGFaceInfo *model = [self modelWithIndex:0];
        [conficeString appendFormat:@"\n%@:%.2f", NSLocalizedString(@"debug_message6", nil), model.confidence];
//        [conficeString appendFormat:@"\n嘴巴:%zi", model.mouseStatus];
//        [conficeString appendFormat:@"\n眼镜:%zi", model.eyesStatus];

    }

    [tempString appendString:conficeString];
    
    return tempString;
}

@end
