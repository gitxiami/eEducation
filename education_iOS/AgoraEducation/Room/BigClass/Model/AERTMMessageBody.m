//
//  EEBCRoomDataManager.m
//  AgoraEducation
//
//  Created by yangmoumou on 2019/10/31.
//  Copyright © 2019 yangmoumou. All rights reserved.
//

#import "AERTMMessageBody.h"
#import "AgoraHttpRequest.h"
#import <CommonCrypto/CommonCrypto.h>

@interface AERTMMessageBody ()

@end


@implementation AERTMMessageBody
+ (NSString *)studentApplyLink {
    NSDictionary *dict = @{
        @"type":@"apply",
        @"resource":@"co-video",
    };
    NSString *applyString = [JsonAndStringConversions dictionaryToJson:dict];
    return applyString;
}

+ (NSString *)studentCancelLink {
    NSDictionary *dict = @{
        @"cmd":@(108),
        @"text":@"",
    };
    NSString *applyString = [JsonAndStringConversions dictionaryToJson:dict];
    return applyString;
}

+ (NSString *)muteVideoStream:(BOOL)stream {
    NSString *type = stream ? @"mute" : @"unmute";
    NSDictionary *dict = @{
        @"type":type,
        @"resource":@"video",
    };
    NSString *message = [JsonAndStringConversions dictionaryToJson:dict];
    return message;
}

+ (NSString *)muteAudioStream:(BOOL)stream {
    NSString *type = stream ? @"mute" : @"unmute";
    NSDictionary *dict = @{
        @"type":type,
        @"resource":@"audio",
    };
    NSString *message = [JsonAndStringConversions dictionaryToJson:dict];
    return message;
}

+ (NSString *)muteChatContent:(BOOL)isMute {
    NSString *type = isMute ? @"mute" : @"unmute";
    NSDictionary *dict = @{
        @"type":type,
        @"resource":@"audio",
    };
    NSString *message = [JsonAndStringConversions dictionaryToJson:dict];
    return message;
}

+ (NSString *)setAndUpdateStudentChannelAttrsWithName:(NSString *)name video:(BOOL)video audio:(BOOL)audio {
    NSDictionary *dict = @{
        @"account":name,
        @"video":@(video),
        @"audio":@(audio),
    };
    NSString *attrString = [JsonAndStringConversions dictionaryToJson:dict];
    return attrString;
}

+ (NSDictionary *)paramsStudentWithUserId:(NSString *)userId name:(NSString *)name video:(BOOL)video audio:(BOOL)audio {
    NSDictionary *dict = @{
        @"account":name,
        @"userId": userId,
        @"video":@(video),
        @"audio":@(audio),
    };
    return dict;
}



+ (NSString *)MD5WithString:(NSString *)str {
    const char *fooData = [str UTF8String];
    unsigned char result[CC_MD5_DIGEST_LENGTH];

    CC_MD5(fooData, (CC_LONG)strlen(fooData), result);
    NSMutableString *saveResult = [NSMutableString string];
    for (int i = 0; i < CC_MD5_DIGEST_LENGTH; i++) {
        [saveResult appendFormat:@"%02x", result[i]];
    }
    return saveResult;
}

+ (BOOL)judgeClassRoomText:(NSString *)text {
    NSString *regex = @"^[a-zA-Z0-9]*$";
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", regex];
    if ([predicate evaluateWithObject:text] && text.length < 11) {
        return YES;
    } else {
        return NO;
    }
}

+ (void)addShadowWithView:(UIView *)view alpha:(CGFloat)alpha {
    view.layer.shadowColor = [UIColor colorWithRed:0/255.0 green:0/255.0 blue:0/255.0 alpha:alpha].CGColor;
    view.layer.shadowOffset = CGSizeMake(0,2);
    view.layer.shadowOpacity = 2;
    view.layer.shadowRadius = 4;
    view.layer.masksToBounds = YES;
}

+ (NSString *)getUserID{
    NSDate *datenow = [NSDate date];
    NSString *timeSp = [NSString stringWithFormat:@"%ld", (long)([datenow timeIntervalSince1970])];
    NSString *uid =  [NSString stringWithFormat:@"%@",[timeSp substringFromIndex:4]];
    return uid;
}

+ (NSString *)sendP2PMessageWithName:(NSString *)name content:(NSString *)content {
    NSDictionary *dict = @{
        @"account":name,
        @"content":content,
    };
    NSString *message = [JsonAndStringConversions dictionaryToJson:dict];
    return message;
}

@end