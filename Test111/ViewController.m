//
//  ViewController.m
//  Test111
//
//  Created by 张旭 on 16/5/5.
//  Copyright © 2016年 zhangXu. All rights reserved.
//

#import "ViewController.h"
#import "UIImage+ColorImage.h"
@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *img;
@property (nonatomic , strong)UIImage *image;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSString *path = [[NSBundle   mainBundle]pathForResource:@"IMG_0011" ofType:@"JPG"];
    
    _img.image = [UIImage imageWithContentsOfFile:path];
    
//    [self grayImage:[UIImage imageWithContentsOfFile:path]];
//    _img.image = [UIImage createImageWithColor:[UIColor grayColor]];
     _img.image = [UIImage grayImage:[UIImage imageWithContentsOfFile:path]];
    
    
//    [UIImage createImageWithColor:[UIColor grayColor]];
   
    
    
    
    // Do any additional setup after loading the view, typically from a nib.
}

- (UIImage *)grayImage:(UIImage *)sourceImage{

    int bitmapInfo = kCGImageAlphaNone;
    int height     = sourceImage.size.height;
    int width      = sourceImage.size.width;
    CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceGray();
    
    CGContextRef context = CGBitmapContextCreate (nil,
                                                  width,
                                                  height,
                                                  8,      // bits per component
                                                  0,
                                                  colorSpace,
                                                  bitmapInfo);
    
    CGColorSpaceRelease(colorSpace);
    if (context == NULL) {
        return nil;
    }
    CGContextDrawImage(context,
                       CGRectMake(0, 0, width, height), sourceImage.CGImage);
    
    UIImage *grayImage = [UIImage imageWithCGImage:CGBitmapContextCreateImage(context)];
    CGContextRelease(context);
    return grayImage;
}

//- (UIImage*)createImageWithColor: (UIColor*) color
//{
//    
//    CGRect rect=CGRectMake(0.0f, 0.0f, 1.0f, 1.0f);
//    
//    UIGraphicsBeginImageContext(rect.size);
//    CGContextRef context = UIGraphicsGetCurrentContext();
//    CGContextSetFillColorWithColor(context, [color CGColor]);
//    CGContextFillRect(context, rect);
//    UIImage*theImage = UIGraphicsGetImageFromCurrentImageContext();
//    
//    UIGraphicsEndImageContext();
//    
//    
//    return theImage;
//}


//- (UIImage *)imageWithColor:(UIColor *)color
//{
//    UIGraphicsBeginImageContextWithOptions(self.size, NO, self.scale);
//    CGContextRefcontext = UIGraphicsGetCurrentContext();
//    CGContextTranslateCTM(context, 0, self.size.height);
//    CGContextScaleCTM(context, 1.0, -1.0);
//    CGContextSetBlendMode(context, kCGBlendModeNormal);
//    CGRect rect = CGRectMake(0, 0, self.size.width, self.size.height);
//    CGContextClipToMask(context, rect, self.CGImage);
//    [color setFill];
//    CGContextFillRect(context, rect);
//    UIImage*newImage = UIGraphicsGetImageFromCurrentImageContext();
//    UIGraphicsEndImageContext();
//    return newImage;
//}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
