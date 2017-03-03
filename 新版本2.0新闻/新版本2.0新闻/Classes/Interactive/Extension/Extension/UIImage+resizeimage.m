//
//  UIImage+resizeimage.m
//  Eric微博
//
//  Created by Eric`Ｗ on 15/12/14.
//  Copyright © 2015年 Eric`Ｗ. All rights reserved.
//

#import "UIImage+resizeimage.h"

@implementation UIImage (resizeimage)

/**
 返回一张被拉伸的图片
 **/
+ (UIImage *)resizeimageWithName:(NSString *)name
{
     UIImage *image = [UIImage imageNamed:name];
     return [image stretchableImageWithLeftCapWidth:image.size.width*0.5 topCapHeight:image.size.height*0.5];
}
@end
