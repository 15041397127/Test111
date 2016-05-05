//
//  UIImage+ColorImage.h
//  HMEmoticon
//
//  Created by 杨修涛 on 16/5/5.
//  Copyright © 2016年 itcast. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (ColorImage)

+ (UIImage*) createImageWithColor: (UIColor*) color;
+ (UIImage *)grayImage:(UIImage *)sourceImage;
@end
