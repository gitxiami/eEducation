//
//  EERemoteVideoView.h
//  AgoraEducation
//
//  Created by yangmoumou on 2019/10/23.
//  Copyright © 2019 yangmoumou. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface EETeacherVideoView : UIView
@property (strong, nonatomic) IBOutlet UIView *teacherVideoView;
@property (weak, nonatomic) IBOutlet UIImageView *speakerImage;
@property (weak, nonatomic) IBOutlet UIImageView *defaultImageView;

@property (weak, nonatomic) IBOutlet UIView *teacherRenderView;
- (void)updateAndsetTeacherName:(NSString * _Nullable)name;
@end

NS_ASSUME_NONNULL_END